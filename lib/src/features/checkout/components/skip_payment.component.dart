import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/features/request/redux/service_state.dart';
import 'package:mnsolutions/src/features/request/screens/describe/describe_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class SkipPaymentComponent extends StatelessWidget {
  const SkipPaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ServiceState>(
      converter: (Store<AppState> store) => store.state.service!,
      builder: (BuildContext context, ServiceState serviceState) {
        if (serviceState.serviceRequestForm?.address?.ruc?.isNotEmpty == true) {
          return OutlinedButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(DescribeScreen.route),
            child: const Text('Omitir por ahora'),
          );
        }
        return Container();
      },
    );
  }
}
