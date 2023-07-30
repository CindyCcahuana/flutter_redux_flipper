import 'package:mnsolutions/src/features/checkout/models/subscription_card.model.dart';
import 'package:mnsolutions/src/features/checkout/models/subscription_plan.model.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> subscriptionCardFormAction(SubscriptionCardModel data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SUBSCRIPTION_CARD_FORM,
          data: data,
        ));

ThunkAction<AppState> subscriptionPlanFormAction(SubscriptionPlanModel plan) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SUBSCRIPTION_PLAN_FORM,
          data: plan,
        ));

ThunkAction<AppState> subscriptionPlansRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SUBSCRIPTION_PLANS_REQUEST,
        ));

ThunkAction<AppState> subscriptionPlansSuccessAction(
        List<Map<String, dynamic>> data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SUBSCRIPTION_PLANS_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> subscriptionPlansFailureAction(String? error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SUBSCRIPTION_PLANS_FAILURE,
          data: error,
        ));

ThunkAction<AppState> subscriptionRequestAction() =>
    (Store<AppState> store) => store.dispatch(
          ResponseModal(
            type: SUBSCRIPTION_REQUEST,
          ),
        );

ThunkAction<AppState> subscriptionSuccessAction() =>
    (Store<AppState> store) => store.dispatch(
          ResponseModal(
            type: SUBSCRIPTION_SUCCESS,
          ),
        );

ThunkAction<AppState> subscriptionFailureAction(String? error) =>
    (Store<AppState> store) => store.dispatch(
          ResponseModal(
            type: SUBSCRIPTION_FAILURE,
            data: error,
          ),
        );
