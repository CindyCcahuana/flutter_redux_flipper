import 'package:mnsolutions/src/common/models/service_request_model.dart';

class ServiceState {
  ServiceRequestModel? serviceRequestDetail;
  ServiceRequestModel? serviceRequestForm;
  bool? serviceRequestLoading;
  bool? serviceRequestSuccess;
  bool? serviceRequestFailure;

  ServiceState({
    this.serviceRequestDetail,
    this.serviceRequestForm,
    this.serviceRequestLoading,
    this.serviceRequestSuccess,
    this.serviceRequestFailure,
  });

  factory ServiceState.initial() => ServiceState(
        serviceRequestDetail: ServiceRequestModel(),
        serviceRequestForm: ServiceRequestModel(),
        serviceRequestLoading: false,
        serviceRequestSuccess: false,
        serviceRequestFailure: false,
      );

  Map<String, dynamic> toMap() => {};
}
