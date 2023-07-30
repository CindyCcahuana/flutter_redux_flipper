import 'dart:convert';

class BannerModel {
  String? id;
  String? url;
  String? from;
  String? to;
  String? link;

  BannerModel({this.id, this.url, this.from, this.to, this.link});

  @override
  String toString() {
    return 'BannerModel(id: $id, url: $url, from: $from, to: $to, link: $link)';
  }

  factory BannerModel.fromMap(Map<String, dynamic> data) => BannerModel(
        id: data['id'] as String?,
        url: data['url'] as String?,
        from: data['from'] as String?,
        to: data['to'] as String?,
        link: data['link'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'url': url,
        'from': from,
        'to': to,
        'link': link,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BannerModel].
  factory BannerModel.fromJson(String data) {
    return BannerModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BannerModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BannerModel copyWith({
    String? id,
    String? url,
    String? from,
    String? to,
    String? link,
  }) {
    return BannerModel(
      id: id ?? this.id,
      url: url ?? this.url,
      from: from ?? this.from,
      to: to ?? this.to,
      link: link ?? this.link,
    );
  }
}
