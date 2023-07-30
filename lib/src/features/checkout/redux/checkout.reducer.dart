import 'package:mnsolutions/src/features/checkout/models/subscription_plan.model.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.state.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';

CheckoutState checkoutReducer(CheckoutState state, ResponseModal action) {
  CheckoutState newState = state;

  switch (action.type) {
    case SUBSCRIPTION_CARD_FORM:
      newState.subscriptionCardModel = newState.subscriptionCardModel?.copyWith(
        number: action.data.number,
        mounth: action.data.mounth,
        year: action.data.year,
        cvv: action.data.cvv,
      );
      return newState;

    case SUBSCRIPTION_PLAN_FORM:
      newState.subscriptionPlanModel = action.data;
      return newState;

    case SUBSCRIPTION_PLANS_REQUEST:
      newState.subscriptionPlansLoading = true;
      newState.subscriptionPlansSuccess = false;
      newState.subscriptionPlansData = List.empty();
      newState.subscriptionPlansFailure = false;
      newState.subscriptionPlansError = '';
      return newState;

    case SUBSCRIPTION_PLANS_SUCCESS:
      newState.subscriptionPlansLoading = false;
      newState.subscriptionPlansSuccess = true;
      newState.subscriptionPlansData = List<SubscriptionPlanModel>.from(
        action.data
            .map((element) => SubscriptionPlanModel.fromMap(element))
            .toList(),
      );
      newState.subscriptionPlansFailure = false;
      newState.subscriptionPlansError = '';
      return newState;

    case SUBSCRIPTION_PLANS_FAILURE:
      newState.subscriptionPlansLoading = false;
      newState.subscriptionPlansSuccess = false;
      newState.subscriptionPlansFailure = true;
      newState.subscriptionPlansError = action.data;
      return newState;

    case SUBSCRIPTION_REQUEST:
      newState.subscriptionLoading = true;
      newState.subscriptionSuccess = false;
      newState.subscriptionFailure = false;
      newState.subscriptionError = '';
      return newState;

    case SUBSCRIPTION_SUCCESS:
      newState.subscriptionLoading = false;
      newState.subscriptionSuccess = true;
      newState.subscriptionFailure = false;
      newState.subscriptionError = '';
      return newState;

    case SUBSCRIPTION_FAILURE:
      newState.subscriptionLoading = false;
      newState.subscriptionSuccess = false;
      newState.subscriptionFailure = true;
      newState.subscriptionError = action.data;
      return newState;

    default:
      return newState;
  }
}
