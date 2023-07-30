import 'dart:convert';

import 'address_model.dart';
import 'service_model.dart';
import 'state_model.dart';
import 'user_model.dart';

class ServiceRequestModel {
  UserModel? user;
  String? video;
  String? description;
  String? dateIncident;
  AddressModel? address;
  ServiceModel? service;
  StateModel? state;

  ServiceRequestModel({
    this.user,
    this.video,
    this.description,
    this.dateIncident,
    this.address,
    this.service,
    this.state,
  });

  @override
  String toString() {
    return 'RequestServiceModel(user: $user, video: $video, description: $description, dateIncident: $dateIncident, address: $address, service: $service, state: $state)';
  }

  factory ServiceRequestModel.fromMap(Map<String, dynamic> data) {
    return ServiceRequestModel(
      user: data['user'] == null
          ? null
          : UserModel.fromMap(data['user'] as Map<String, dynamic>),
      video: data['video'] as String?,
      description: data['description'] as String?,
      dateIncident: data['date_incident'] as String?,
      address: data['address'] == null
          ? null
          : AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      service: data['service'] == null
          ? null
          : ServiceModel.fromMap(data['service'] as Map<String, dynamic>),
      state: data['state'] == null
          ? null
          : StateModel.fromMap(data['state'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'video': video,
        'description': description,
        'date_incident': dateIncident,
        'address': address?.toMap(),
        'service': service?.toMap(),
        'state': state?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceRequestModel].
  factory ServiceRequestModel.fromJson(String data) {
    return ServiceRequestModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceRequestModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ServiceRequestModel copyWith({
    UserModel? user,
    String? video,
    String? description,
    String? dateIncident,
    AddressModel? address,
    ServiceModel? service,
    StateModel? state,
  }) {
    return ServiceRequestModel(
      user: user ?? this.user,
      video: video ?? this.video,
      description: description ?? this.description,
      dateIncident: dateIncident ?? this.dateIncident,
      address: address ?? this.address,
      service: service ?? this.service,
      state: state ?? this.state,
    );
  }
}
