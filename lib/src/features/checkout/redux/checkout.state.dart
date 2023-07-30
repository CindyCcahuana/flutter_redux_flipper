import 'package:mnsolutions/src/features/checkout/models/subscription_card.model.dart';
import 'package:mnsolutions/src/features/checkout/models/subscription_plan.model.dart';

class CheckoutState {
  SubscriptionCardModel? subscriptionCardModel;
  SubscriptionPlanModel? subscriptionPlanModel;

  bool? subscriptionPlansLoading;
  bool? subscriptionPlansSuccess;
  List<SubscriptionPlanModel>? subscriptionPlansData;
  bool? subscriptionPlansFailure;
  String? subscriptionPlansError;

  bool? subscriptionLoading;
  bool? subscriptionSuccess;
  bool? subscriptionFailure;
  String? subscriptionError;

  CheckoutState({
    this.subscriptionCardModel,
    this.subscriptionPlanModel,
    this.subscriptionPlansLoading,
    this.subscriptionPlansSuccess,
    this.subscriptionPlansData,
    this.subscriptionPlansFailure,
    this.subscriptionPlansError,
    this.subscriptionLoading,
    this.subscriptionSuccess,
    this.subscriptionFailure,
    this.subscriptionError,
  });

  factory CheckoutState.initial() => CheckoutState(
        subscriptionCardModel: SubscriptionCardModel(),
        subscriptionPlanModel: SubscriptionPlanModel(),
        subscriptionPlansLoading: false,
        subscriptionPlansSuccess: false,
        subscriptionPlansData: List<SubscriptionPlanModel>.empty(),
        subscriptionPlansFailure: false,
        subscriptionPlansError: '',
        subscriptionLoading: false,
        subscriptionSuccess: false,
        subscriptionFailure: false,
        subscriptionError: '',
      );

  Map<String, dynamic> toMap() => {};
}
