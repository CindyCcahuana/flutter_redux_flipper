import 'dart:convert';

class ServiceModel {
  String? id;
  String? image;
  String? title;
  String? description;

  ServiceModel({this.id, this.image, this.title, this.description});

  @override
  String toString() =>
      'Service(id: $id, image: $image, title: $title, description: $description)';

  factory ServiceModel.fromMap(Map<String, dynamic> data) => ServiceModel(
        id: data['id'] as String?,
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
        'title': title,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceModel].
  factory ServiceModel.fromJson(String data) {
    return ServiceModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ServiceModel copyWith({
    String? id,
    String? image,
    String? title,
    String? description,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
