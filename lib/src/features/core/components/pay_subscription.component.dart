import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/features/checkout/screens/payment/payment_screen.dart';
import 'package:mnsolutions/src/features/session/redux/session.state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class PaySubscriptionComponent extends StatelessWidget {
  const PaySubscriptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SessionState>(
      converter: (Store<AppState> store) => store.state.session!,
      builder: (BuildContext context, SessionState sessionState) {
        if (sessionState.loading == true) return Container();
        if (sessionState.error?.isNotEmpty == true) {
          return const Text('error getting services');
        }
        if (sessionState.user?.id?.isNotEmpty == true) {
          UserModel user = sessionState.user!;
          if (user.dateSuscription?.isAfter(DateTime.now()) == true) {
            int remainDays =
                user.dateSuscription!.difference(DateTime.now()).inDays;
            return TextButton.icon(
              icon: const Icon(Icons.date_range_outlined),
              onPressed: () {},
              label: Text('$remainDays Dias restantes'),
            );
          }
          return ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PaymentScreen.route);
            },
            child: const Text('PAGAR SUSCRIPCIÓN'),
          );
        }
        return Container();
      },
    );
  }
}
