import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/features/checkout/components/dropdown_subscription_plans.component.dart';
import 'package:mnsolutions/src/features/checkout/components/skip_payment.component.dart';
import 'package:mnsolutions/src/features/checkout/models/subscription_card.model.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.action.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.state.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:validatorless/validatorless.dart';

class PaymentScreen extends StatefulWidget {
  static const String route = '/checkout/payment';

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  final formkey = GlobalKey<FormState>();

  bool ownCard = false;
  bool policies = false;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: spacing[2]),
            child: const SkipPaymentComponent(),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FormComponent(
            formKey: formkey,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: Text(
                              "MNSOLUTIONS SUBSCRIPCION",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: DropdownSubscriptionPlansComponent(
                              validator: Validatorless.required(
                                'Seleccion su plan de subscripción',
                              ),
                            ),
                          ),
                          FractionallySizedBoxComponent(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: spacing[9]),
                                  child: TextInputComponent(
                                    labelText: "Numero de tarjeta",
                                    autofocus: true,
                                    keyboardType: TextInputType.number,
                                    onChanged: (string) {
                                      if (string.isNotEmpty) {
                                        store.dispatch(
                                          subscriptionCardFormAction(
                                            SubscriptionCardModel(
                                              number: string,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    validator: Validatorless.required(
                                      'Brindanos tu numero de tarjeta',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: spacing[9]),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: TextInputComponent(
                                          labelText: "Mes",
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          onChanged: (string) {
                                            if (string.isNotEmpty) {
                                              store.dispatch(
                                                subscriptionCardFormAction(
                                                  SubscriptionCardModel(
                                                    mounth: string,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          validator: Validatorless.regex(
                                            RegExp(r'^(0[1-9]|1[012])$'),
                                            'Ejemplo: 02',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: spacing[9],
                                      ),
                                      Flexible(
                                        child: TextInputComponent(
                                          autofocus: true,
                                          labelText: "Año",
                                          keyboardType: TextInputType.number,
                                          onChanged: (string) {
                                            if (string.isNotEmpty) {
                                              store.dispatch(
                                                subscriptionCardFormAction(
                                                  SubscriptionCardModel(
                                                    year: string,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          validator: Validatorless.regex(
                                            RegExp(r'^(\b(20)\d{2}\b)$'),
                                            'Ejemplo: 2035',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: spacing[9]),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: TextInputComponent(
                                          labelText: "Codigo a verificación",
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          onChanged: (string) {
                                            if (string.isNotEmpty) {
                                              store.dispatch(
                                                subscriptionCardFormAction(
                                                  SubscriptionCardModel(
                                                    cvv: string,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          validator: Validatorless.required(
                                            'Ejemplo: 123',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text('La tarjeta esta a mi nombre'),
                              value: ownCard,
                              onChanged: (bool? value) {
                                setState(() {
                                  ownCard = value!;
                                });
                              },
                            ),
                          ),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                                'Acepto terminos y policas de servicio'),
                            value: policies,
                            onChanged: (bool? value) {
                              setState(() {
                                policies = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: double.infinity,
                  child: ContentWrapperComponent(
                    child: StoreConnector<AppState, CheckoutState>(
                      converter: (Store<AppState> store) =>
                          store.state.checkout!,
                      builder:
                          (BuildContext context, CheckoutState checkoutState) {
                        String? currencyId = checkoutState
                            .subscriptionPlanModel?.autoRecurring?.currencyId;
                        int? amount = checkoutState.subscriptionPlanModel
                            ?.autoRecurring?.transactionAmount;
                        return ElevatedButton(
                          onPressed: (ownCard && policies)
                              ? () {
                                  bool isValid =
                                      formkey.currentState!.validate();
                                  if (isValid) {
                                    store.dispatch(subscribeClient());
                                  }
                                }
                              : null,
                          child: Text(
                            "PAGAR ${currencyId ?? ''} ${amount ?? ''}",
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
