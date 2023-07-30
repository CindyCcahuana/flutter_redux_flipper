import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/features/address/redux/addres.action.dart';
import 'package:mnsolutions/src/features/address/redux/address.thunk.dart';
import 'package:mnsolutions/src/features/address/screens/identity/identity_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:validatorless/validatorless.dart';

class ReferenceScreen extends StatefulWidget {
  static const String route = '/address/reference';

  const ReferenceScreen({super.key});

  @override
  State<ReferenceScreen> createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  final formkey = GlobalKey<FormState>();

  bool isIdentityAddress = false;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: FormComponent(
            formKey: formkey,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              style: Theme.of(context).textTheme.titleLarge,
                              "¿ Brindanos una referencia ?"),
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: FractionallySizedBoxComponent(
                              child: TextInputComponent(
                                maxLines: null,
                                autofocus: true,
                                onChanged: (string) {
                                  if (string.isNotEmpty) {
                                    store.dispatch(
                                      addressFormAction(
                                          AddressModel(reference: string)),
                                    );
                                  }
                                },
                                validator: Validatorless.multiple([
                                  Validatorless.required(
                                      'Brindanos una referencia'),
                                  Validatorless.min(
                                      30, 'Danos una referencia detallada'),
                                ]),
                              ),
                            ),
                          ),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text('Mi dirección es un negocio'),
                            value: isIdentityAddress,
                            onChanged: (bool? value) {
                              store.dispatch(addressFormAction(AddressModel()));
                              setState(() {
                                isIdentityAddress = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: double.infinity,
                  child: ContentWrapperComponent(
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = formkey.currentState!.validate();
                        if (isValid) {
                          if (isIdentityAddress) {
                            Navigator.of(context)
                                .pushNamed(IdentityScreen.route);
                          } else {
                            store.dispatch(saveAddress());
                          }
                        }
                      },
                      child: Text(isIdentityAddress ? "CONTINUAR" : "GUARDAR"),
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
