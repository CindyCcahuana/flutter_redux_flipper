import 'dart:convert';

import 'package:mnsolutions/src/common/models/address_model.dart';

class UserModel {
  String? id;
  String? avatar;
  String? name;
  String? lastName;
  String? phone;
  DateTime? dateSuscription;
  String? numberSuscription;
  String? rol;
  AddressModel? address;
  List<AddressModel>? addresses;
  bool? isAnonymous;

  UserModel({
    this.id,
    this.avatar,
    this.name,
    this.lastName,
    this.phone,
    this.dateSuscription,
    this.numberSuscription,
    this.rol,
    this.address,
    this.addresses,
    this.isAnonymous,
  });

  @override
  String toString() {
    return 'User(id: $id, avatar: $avatar, name: $name, lastName: $lastName, phone: $phone, dateSuscription: $dateSuscription, numberSuscription: $numberSuscription, rol: $rol, isAnonymous: $isAnonymous,)';
  }

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as String?,
        avatar: data['avatar'] as String?,
        name: data['name'] as String?,
        lastName: data['lastName'] as String?,
        phone: data['phone'] as String?,
        dateSuscription: data['date_suscription'] != null
            ? DateTime.tryParse(data['date_suscription'])
            : null,
        numberSuscription: data['number_suscription'] as String?,
        rol: data['rol'] as String?,
        address: data['address'] != null
            ? AddressModel.fromMap(data['address'])
            : null,
        addresses: (data['addresses'] != null
            ? List<AddressModel>.from(data['addresses']
                .map((element) => AddressModel.fromMap(element)))
            : null),
        isAnonymous: data['is_anonymous'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'avatar': avatar,
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'date_suscription': dateSuscription?.toString(),
        'number_suscription': numberSuscription,
        'rol': rol,
        'address': address?.toMap(),
        'addresses': addresses?.map((e) => e.toMap()).toList(),
        'is_anonymous': isAnonymous,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    String? id,
    String? avatar,
    String? name,
    String? lastName,
    String? phone,
    DateTime? dateSuscription,
    String? numberSuscription,
    String? rol,
    AddressModel? address,
    List<AddressModel>? addresses,
    bool? isAnonymous,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      dateSuscription: dateSuscription ?? this.dateSuscription,
      numberSuscription: numberSuscription ?? this.numberSuscription,
      rol: rol ?? this.rol,
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
