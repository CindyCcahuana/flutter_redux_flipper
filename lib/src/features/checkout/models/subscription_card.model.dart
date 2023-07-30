import 'dart:convert';

class SubscriptionCardModel {
  String? number;
  String? mounth;
  String? year;
  String? cvv;

  SubscriptionCardModel({this.number, this.mounth, this.year, this.cvv});

  @override
  String toString() {
    return 'SubscriptionCardModel(number: $number, mounth: $mounth, year: $year, cvv: $cvv)';
  }

  factory SubscriptionCardModel.fromMap(Map<String, dynamic> data) {
    return SubscriptionCardModel(
      number: data['number'] as String?,
      mounth: data['mounth'] as String?,
      year: data['year'] as String?,
      cvv: data['cvv'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'number': number,
        'mounth': mounth,
        'year': year,
        'cvv': cvv,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscriptionCardModel].
  factory SubscriptionCardModel.fromJson(String data) {
    return SubscriptionCardModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscriptionCardModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SubscriptionCardModel copyWith({
    String? number,
    String? mounth,
    String? year,
    String? cvv,
  }) {
    return SubscriptionCardModel(
      number: number ?? this.number,
      mounth: mounth ?? this.mounth,
      year: year ?? this.year,
      cvv: cvv ?? this.cvv,
    );
  }
}
