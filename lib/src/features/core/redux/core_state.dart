import 'package:mnsolutions/src/common/models/banner_model.dart';
import 'package:mnsolutions/src/common/models/service_model.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';

class CoreState {
  bool? bannersLoading;
  bool? bannersSuccess;
  List<BannerModel>? banners;
  bool? bannersFailure;
  String? bannersError;

  bool? serviceRequestsLoading;
  dynamic serviceRequestsError;
  List<ServiceRequestModel>? serviceRequests;

  bool? servicesLoading;
  dynamic servicesError;
  List<ServiceModel>? services;

  CoreState({
    this.bannersLoading,
    this.bannersSuccess,
    this.banners,
    this.bannersFailure,
    this.bannersError,
    this.serviceRequestsLoading,
    this.serviceRequestsError,
    this.serviceRequests,
    this.servicesLoading,
    this.servicesError,
    this.services,
  });

  factory CoreState.initial() => CoreState(
        bannersLoading: false,
        bannersSuccess: false,
        banners: List<BannerModel>.empty(),
        bannersFailure: false,
        bannersError: '',
        serviceRequestsLoading: false,
        serviceRequestsError: '',
        serviceRequests: List<ServiceRequestModel>.empty(),
        servicesLoading: false,
        servicesError: '',
        services: List<ServiceModel>.empty(),
      );

  Map<String, dynamic> toMap() => {};
}
