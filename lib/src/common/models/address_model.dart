import 'dart:convert';

class AddressModel {
  String? id;
  String? district;
  String? address;
  String? reference;
  String? ruc;
  String? idUser;

  AddressModel({
    this.id,
    this.district,
    this.address,
    this.reference,
    this.ruc,
    this.idUser,
  });

  @override
  String toString() {
    return 'Address(id: $id, district: $district, address: $address, reference: $reference, ruc: $ruc, idUser: $idUser)';
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        id: data['id'] as String?,
        district: data['district'] as String?,
        address: data['address'] as String?,
        reference: data['reference'] as String?,
        ruc: data['ruc'] as String?,
        idUser: data['id_user'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'district': district,
        'address': address,
        'reference': reference,
        'ruc': ruc,
        'id_user': idUser,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressModel].
  factory AddressModel.fromJson(String data) {
    return AddressModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddressModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AddressModel copyWith({
    String? id,
    String? district,
    String? address,
    String? reference,
    String? ruc,
    String? idUser,
  }) {
    return AddressModel(
      id: id ?? this.id,
      district: district ?? this.district,
      address: address ?? this.address,
      reference: reference ?? this.reference,
      ruc: ruc ?? this.ruc,
      idUser: idUser ?? this.idUser,
    );
  }
}
