import 'dart:convert';

import 'auto_recurring.model.dart';

class SubscriptionPlanModel {
  String? id;
  String? reason;
  String? externalReference;
  AutoRecurringModel? autoRecurring;

  SubscriptionPlanModel({
    this.id,
    this.reason,
    this.externalReference,
    this.autoRecurring,
  });

  @override
  String toString() {
    return 'SubscriptionPlanModel(id: $id, reason: $reason, externalReference: $externalReference, autoRecurring: $autoRecurring)';
  }

  factory SubscriptionPlanModel.fromMap(Map<String, dynamic> data) {
    return SubscriptionPlanModel(
      id: data['id'] as String?,
      reason: data['reason'] as String?,
      externalReference: data['external_reference'] as String?,
      autoRecurring: data['auto_recurring'] == null
          ? null
          : AutoRecurringModel.fromMap(
              data['auto_recurring'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'reason': reason,
        'external_reference': externalReference,
        'auto_recurring': autoRecurring?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscriptionPlanModel].
  factory SubscriptionPlanModel.fromJson(String data) {
    return SubscriptionPlanModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscriptionPlanModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SubscriptionPlanModel copyWith({
    String? id,
    String? reason,
    String? externalReference,
    AutoRecurringModel? autoRecurring,
  }) {
    return SubscriptionPlanModel(
      id: id ?? this.id,
      reason: reason ?? this.reason,
      externalReference: externalReference ?? this.externalReference,
      autoRecurring: autoRecurring ?? this.autoRecurring,
    );
  }
}
