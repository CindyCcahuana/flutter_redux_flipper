import 'dart:convert';

class StateModel {
  String? id;
  String? description;

  StateModel({this.id, this.description});

  @override
  String toString() => 'State(id: $id, description: $description)';

  factory StateModel.fromMap(Map<String, dynamic> data) => StateModel(
        id: data['id'] as String?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StateModel].
  factory StateModel.fromJson(String data) {
    return StateModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StateModel] to a JSON string.
  String toJson() => json.encode(toMap());

  StateModel copyWith({
    String? id,
    String? description,
  }) {
    return StateModel(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }
}
