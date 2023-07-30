import 'dart:convert';
import 'package:mnsolutions/src/features/address/redux/address.state.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.state.dart';
import 'package:mnsolutions/src/features/core/redux/core_state.dart';
import 'package:mnsolutions/src/features/request/redux/service_state.dart';
import 'package:mnsolutions/src/features/session/redux/session.state.dart';

class AppState {
  final CoreState? core;
  final ServiceState? service;
  final SessionState? session;
  final CheckoutState? checkout;
  final AddressState? address;

  AppState({
    this.core,
    this.service,
    this.session,
    this.checkout,
    this.address,
  });

  factory AppState.initial() => AppState(
        core: CoreState.initial(),
        service: ServiceState.initial(),
        session: SessionState.initial(),
        checkout: CheckoutState.initial(),
        address: AddressState.initial(),
      );

  factory AppState.fromMap(Map<String, dynamic> data) => AppState(
        core: CoreState(),
        service: ServiceState(),
        session: data['session'] != null
            ? SessionState.fromMap(data['session'])
            : null,
        checkout: CheckoutState(),
        address: AddressState(),
      );

  Map<String, dynamic> toMap() => {
        'core': core?.toMap(),
        'service': service?.toMap(),
        'session': session?.toMap(),
        'checkout': checkout?.toMap(),
        'address': address?.toMap(),
      };

  factory AppState.fromDynamicJson(dynamic data) {
    print('Persistor Data');
    print(data);
    return AppState.fromJson(data);
  }

  factory AppState.fromJson(String data) {
    return AppState.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  AppState copyWith({
    CoreState? core,
    ServiceState? service,
    SessionState? session,
    CheckoutState? checkout,
    AddressState? address,
  }) =>
      AppState(
        core: core ?? this.core,
        service: service ?? this.service,
        session: session ?? this.session,
        checkout: checkout ?? this.checkout,
        address: address ?? this.address,
      );
}
