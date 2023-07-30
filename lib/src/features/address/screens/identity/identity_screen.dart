import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/common/utils/rut_validator/rut_validator.util.dart';
import 'package:mnsolutions/src/features/address/redux/addres.action.dart';
import 'package:mnsolutions/src/features/address/redux/address.thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';

class IdentityScreen extends StatefulWidget {
  static const String route = '/address/identity';

  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
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
                                "¿ RUC ?"),
                            Padding(
                              padding: EdgeInsets.only(top: spacing[9]),
                              child: TextInputComponent(
                                labelText: " RUC ",
                                autofocus: true,
                                onChanged: (string) {
                                  if (string.isNotEmpty) {
                                    store.dispatch(
                                      addressFormAction(
                                          AddressModel(ruc: string)),
                                    );
                                  }
                                },
                                validator: (String? value) {
                                  if (!(value?.isNotEmpty == true)) {
                                    return "RUC es requerido";
                                  }
                                  if (!(isRUCValid(value!) == true)) {
                                    return "El RUC no es valido";
                                  }
                                  return null;
                                },
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
                          store.dispatch(saveAddress());
                        }
                      },
                      child: const Text("GUARDAR"),
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
