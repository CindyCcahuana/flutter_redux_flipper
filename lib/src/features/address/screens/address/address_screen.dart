import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/features/address/redux/addres.action.dart';
import 'package:mnsolutions/src/features/address/screens/reference/reference_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:validatorless/validatorless.dart';

class AddressScreen extends StatefulWidget {
  static const String route = '/address/address';

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final formkey = GlobalKey<FormState>();

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
                      child: FractionallySizedBoxComponent(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                style: Theme.of(context).textTheme.titleLarge,
                                "¿ Cuál es tu dirección ?"),
                            Padding(
                              padding: EdgeInsets.only(top: spacing[9]),
                              child: TextInputComponent(
                                maxLines: null,
                                labelText: "Dirección",
                                autofocus: true,
                                onChanged: (string) {
                                  if (string.isNotEmpty) {
                                    store.dispatch(
                                      addressFormAction(
                                          AddressModel(address: string)),
                                    );
                                  }
                                },
                                validator: Validatorless.multiple([
                                  Validatorless.required(
                                      'Escribe tu Dirección'),
                                  Validatorless.min(
                                      10, 'Danos más detalles de tu Dirección'),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  width: double.infinity,
                  child: ContentWrapperComponent(
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = formkey.currentState!.validate();
                        if (isValid) {
                          Navigator.of(context)
                              .pushNamed(ReferenceScreen.route);
                        }
                      },
                      child: const Text("CONTINUAR"),
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
