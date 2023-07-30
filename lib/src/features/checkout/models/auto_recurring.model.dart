import 'dart:convert';

import 'free_trial.model.dart';

class AutoRecurringModel {
  int? frequency;
  String? frequencyType;
  int? repetitions;
  int? billingDay;
  bool? billingDayProportional;
  FreeTrialModel? freeTrial;
  int? transactionAmount;
  String? currencyId;

  AutoRecurringModel({
    this.frequency,
    this.frequencyType,
    this.repetitions,
    this.billingDay,
    this.billingDayProportional,
    this.freeTrial,
    this.transactionAmount,
    this.currencyId,
  });

  @override
  String toString() {
    return 'AutoRecurring(frequency: $frequency, frequencyType: $frequencyType, repetitions: $repetitions, billingDay: $billingDay, billingDayProportional: $billingDayProportional, freeTrial: $freeTrial, transactionAmount: $transactionAmount, currencyId: $currencyId)';
  }

  factory AutoRecurringModel.fromMap(Map<String, dynamic> data) =>
      AutoRecurringModel(
        frequency: data['frequency'] as int?,
        frequencyType: data['frequency_type'] as String?,
        repetitions: data['repetitions'] as int?,
        billingDay: data['billing_day'] as int?,
        billingDayProportional: data['billing_day_proportional'] as bool?,
        freeTrial: data['free_trial'] == null
            ? null
            : FreeTrialModel.fromMap(
                data['free_trial'] as Map<String, dynamic>),
        transactionAmount: data['transaction_amount'] as int?,
        currencyId: data['currency_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'frequency': frequency,
        'frequency_type': frequencyType,
        'repetitions': repetitions,
        'billing_day': billingDay,
        'billing_day_proportional': billingDayProportional,
        'free_trial': freeTrial?.toMap(),
        'transaction_amount': transactionAmount,
        'currency_id': currencyId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AutoRecurringModel].
  factory AutoRecurringModel.fromJson(String data) {
    return AutoRecurringModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AutoRecurringModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AutoRecurringModel copyWith({
    int? frequency,
    String? frequencyType,
    int? repetitions,
    int? billingDay,
    bool? billingDayProportional,
    FreeTrialModel? freeTrial,
    int? transactionAmount,
    String? currencyId,
  }) {
    return AutoRecurringModel(
      frequency: frequency ?? this.frequency,
      frequencyType: frequencyType ?? this.frequencyType,
      repetitions: repetitions ?? this.repetitions,
      billingDay: billingDay ?? this.billingDay,
      billingDayProportional:
          billingDayProportional ?? this.billingDayProportional,
      freeTrial: freeTrial ?? this.freeTrial,
      transactionAmount: transactionAmount ?? this.transactionAmount,
      currencyId: currencyId ?? this.currencyId,
    );
  }
}
