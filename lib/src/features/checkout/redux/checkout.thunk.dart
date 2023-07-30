import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/common/screens/loading/loading_screen.dart';
import 'package:mnsolutions/src/features/checkout/models/subscription_card.model.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.action.dart';
import 'package:mnsolutions/src/features/checkout/services/subscription.service.dart';
import 'package:mnsolutions/src/features/request/screens/describe/describe_screen.dart';
import 'package:mnsolutions/src/features/session/redux/session.thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> initializeCheckoutFlow() => (Store<AppState> store) {
      store.dispatch(getSubscriptionPlans());
    };

ThunkAction<AppState> getSubscriptionPlans() => (Store<AppState> store) async {
      try {
        store.dispatch(subscriptionPlansRequestAction());
        List<Map<String, dynamic>> data =
            await SubscriptionService().getSubscriptionPlans();
        store.dispatch(subscriptionPlansSuccessAction(data));
      } on Exception catch (e) {
        store.dispatch(subscriptionPlansFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> subscribeClient() => (Store<AppState> store) async {
      try {
        store.dispatch(subscriptionRequestAction());
        store.dispatch(NavigateToAction.replace(LoadingScreen.route));
        SubscriptionCardModel card =
            store.state.checkout!.subscriptionCardModel!;
        var data = await SubscriptionService().createSubscription();
        await store.dispatch(updateSession(UserModel(
          numberSuscription: data['id'],
          dateSuscription: DateTime.now().add(const Duration(days: 365)),
        )));
        store.dispatch(NavigateToAction.replace(DescribeScreen.route));
        store.dispatch(subscriptionSuccessAction());
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(subscriptionFailureAction(e.toString()));
      }
    };
