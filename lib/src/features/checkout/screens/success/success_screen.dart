import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/features/core/screens/history/history_screen.dart';

class SuccessScreen extends StatelessWidget {
  static const String route = '/checkout/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                    child: FractionallySizedBoxComponent(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 200,
                            color: Theme.of(context).primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: spacing[15]),
                            child: Text(
                              style: Theme.of(context).textTheme.titleLarge,
                              "Pago completado con exito",
                              textAlign: TextAlign.center,
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
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(HistoryScreen.route),
                    child: const Text("CONTINUAR"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
