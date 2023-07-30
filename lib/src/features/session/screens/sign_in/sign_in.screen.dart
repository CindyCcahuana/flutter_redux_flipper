import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/common/components/form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/features/session/redux/session.thunk.dart';
import 'package:mnsolutions/src/features/session/screens/sign_up/sign_up.screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:validatorless/validatorless.dart';

class SignInScreen extends HookWidget {
  static const String route = '/login';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final formkey = useState(GlobalKey<FormState>());

    final email = useState("");
    final password = useState("");

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: FractionallySizedBoxComponent(
              child: FormComponent(
                formKey: formkey.value,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: spacing[5]),
                      child: Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    TextInputComponent(
                      labelText: "Email",
                      onChanged: (value) => email.value = value,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validatorless.multiple([
                        Validatorless.email("Email no valido"),
                        Validatorless.required("Email es requerido"),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: spacing[4]),
                      child: TextInputComponent(
                        labelText: "Contraseña",
                        onChanged: (value) => password.value = value,
                        obscureText: true,
                        validator:
                            Validatorless.required("Contraseña requerida"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          bool isValid = formkey.value.currentState!.validate();
                          if (isValid) {
                            store.dispatch(
                                loginUser(email.value, password.value));
                          }
                        },
                        child: const Text("INICIAR SESSION"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: spacing[5]),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => store.dispatch(
                              NavigateToAction.replace(SignUpScreen.route)),
                          child: const Text("CREAR CUENTA"),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => store.dispatch(loginGoogle()),
                            icon: const Icon(Icons.mail),
                          ),
                          IconButton(
                            onPressed: () => store.dispatch(loginFacebook()),
                            icon: const Icon(Icons.facebook),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => store.dispatch(loginAnonymoysly()),
                        child: const Text("INGRESAR COMO INVITADO"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
