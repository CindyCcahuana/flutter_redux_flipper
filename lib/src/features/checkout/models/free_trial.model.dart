import 'dart:convert';

class FreeTrialModel {
  int? frequency;
  String? frequencyType;
  int? firstInvoiceOffset;

  FreeTrialModel({this.frequency, this.frequencyType, this.firstInvoiceOffset});

  @override
  String toString() {
    return 'FreeTrial(frequency: $frequency, frequencyType: $frequencyType, firstInvoiceOffset: $firstInvoiceOffset)';
  }

  factory FreeTrialModel.fromMap(Map<String, dynamic> data) => FreeTrialModel(
        frequency: data['frequency'] as int?,
        frequencyType: data['frequency_type'] as String?,
        firstInvoiceOffset: data['first_invoice_offset'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'frequency': frequency,
        'frequency_type': frequencyType,
        'first_invoice_offset': firstInvoiceOffset,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FreeTrialModel].
  factory FreeTrialModel.fromJson(String data) {
    return FreeTrialModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FreeTrialModel] to a JSON string.
  String toJson() => json.encode(toMap());

  FreeTrialModel copyWith({
    int? frequency,
    String? frequencyType,
    int? firstInvoiceOffset,
  }) {
    return FreeTrialModel(
      frequency: frequency ?? this.frequency,
      frequencyType: frequencyType ?? this.frequencyType,
      firstInvoiceOffset: firstInvoiceOffset ?? this.firstInvoiceOffset,
    );
  }
}
