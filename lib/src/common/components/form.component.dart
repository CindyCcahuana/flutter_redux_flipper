import 'package:flutter/material.dart';

class Validators {
  String? textArea(String string) {
    return '';
  }
}

class FormComponent extends StatelessWidget {
  final Key? formKey;
  final Widget child;

  const FormComponent({
    super.key,
    this.formKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: child,
    );
  }
}
