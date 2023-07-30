import 'package:mnsolutions/src/features/checkout/services/mock/subscription.mock.dart';
import 'package:mnsolutions/src/features/checkout/services/mock/subscription_plans.mock.dart';
import 'package:mnsolutions/src/features/checkout/services/mock/update_subscription.mock.dart';

class SubscriptionService {
  Future<List<Map<String, dynamic>>> getSubscriptionPlans() {
    return Future.value(subscriptionPlansMock);
  }

  Future<Map<String, dynamic>> createSubscription() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => subscriptionMock,
    );
  }

  Future<Map<String, dynamic>> updateSubscription(String subscriptionId) {
    return Future.value(updateSubscriptionMock);
  }
}
