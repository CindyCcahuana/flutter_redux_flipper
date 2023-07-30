import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.action.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class DropdownSubscriptionPlansComponent extends StatelessWidget {
  final String? Function(String?)? validator;

  const DropdownSubscriptionPlansComponent({
    super.key,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutState>(
      converter: (Store<AppState> store) => store.state.checkout!,
      builder: (BuildContext context, CheckoutState checkoutState) {
        if (checkoutState.subscriptionPlansLoading == true) return Container();
        if (checkoutState.subscriptionPlansFailure == true) {
          return Text(
              checkoutState.subscriptionPlansError ?? 'error getting services');
        }
        if (checkoutState.subscriptionPlansData?.isNotEmpty == true) {
          var subscriptionPlans = checkoutState.subscriptionPlansData;
          String? subscriptionPlan = checkoutState.subscriptionPlanModel?.id;
          return FractionallySizedBoxComponent(
            child: DropdownButtonFormField(
              isExpanded: true,
              validator: validator,
              value: subscriptionPlan,
              items: subscriptionPlans?.map((subscriptionPlan) {
                return DropdownMenuItem(
                  value: subscriptionPlan.id,
                  child: Text(
                    '${subscriptionPlan.autoRecurring?.transactionAmount} ${subscriptionPlan.autoRecurring?.currencyId}, ${subscriptionPlan.reason}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                final store = StoreProvider.of<AppState>(context);
                store.dispatch(subscriptionPlanFormAction(
                  subscriptionPlans!
                      .firstWhere((element) => element.id == value),
                ));
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
