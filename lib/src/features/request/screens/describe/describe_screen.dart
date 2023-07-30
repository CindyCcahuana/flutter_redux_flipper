import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/request/components/dropdown_services.component.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/features/request/screens/date/date_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:validatorless/validatorless.dart';

class DescribeScreen extends StatefulWidget {
  static const String route = '/request/describe';

  const DescribeScreen({super.key});

  @override
  State<DescribeScreen> createState() => _DescribeScreenState();
}

class _DescribeScreenState extends State<DescribeScreen> {
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
                const DropdownServicesComponent(),
                Expanded(
                    flex: 3,
                    child: Center(
                      child: FractionallySizedBoxComponent(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                style: Theme.of(context).textTheme.titleLarge,
                                "¿ Describe el problema ?"),
                            Padding(
                              padding: EdgeInsets.only(top: spacing[9]),
                              child: TextInputComponent(
                                maxLines: null,
                                autofocus: true,
                                onChanged: (string) {
                                  if (string.isNotEmpty) {
                                    store.dispatch(
                                      requestServiceFormAction(
                                          ServiceRequestModel(
                                        description: string,
                                      )),
                                    );
                                  }
                                },
                                validator: Validatorless.required(
                                  'Comentanos cual es el problema',
                                ),
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
                          Navigator.of(context).pushNamed(DateScreen.route);
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
