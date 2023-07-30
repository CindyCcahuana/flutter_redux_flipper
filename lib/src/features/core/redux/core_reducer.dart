import 'package:mnsolutions/src/common/models/service_model.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/core/redux/core_state.dart';
import 'package:mnsolutions/src/features/core/redux/core_type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';

CoreState coreReducer(CoreState state, ResponseModal action) {
  CoreState newState = state;

  switch (action.type) {
    case BANNER_LIST_REQUEST:
      newState.bannersLoading = true;
      newState.bannersSuccess = false;
      newState.bannersFailure = false;
      return newState;

    case BANNER_LIST_SUCCESS:
      newState.bannersLoading = false;
      newState.bannersSuccess = true;
      newState.banners = action.data;
      newState.bannersFailure = false;
      return newState;

    case BANNER_LIST_FAILURE:
      newState.bannersLoading = false;
      newState.bannersSuccess = false;
      newState.bannersFailure = true;
      newState.bannersError = action.data;
      return newState;

    case REQUEST_SERVICE_LIST_REQUEST:
      newState.serviceRequestsLoading = true;
      newState.serviceRequestsError = null;
      newState.serviceRequests = null;
      return newState;

    case REQUEST_SERVICE_LIST_SUCCESS:
      List<ServiceRequestModel> listServiceRequestModel = [];
      for (var object in action.data) {
        listServiceRequestModel.add(ServiceRequestModel.fromMap(object));
      }
      newState.serviceRequestsLoading = false;
      newState.serviceRequestsError = null;
      newState.serviceRequests = listServiceRequestModel;
      return newState;

    case REQUEST_SERVICE_LIST_FAILURE:
      newState.serviceRequestsLoading = false;
      newState.serviceRequestsError = action.data;
      newState.serviceRequests = null;
      return newState;

    case SERVICES_LIST_REQUEST:
      newState.servicesLoading = true;
      newState.servicesError = null;
      newState.services = null;
      return newState;

    case SERVICES_LIST_SUCCESS:
      List<ServiceModel> listServicesModel = [];
      for (var object in action.data) {
        listServicesModel.add(ServiceModel.fromMap(object));
      }

      newState.servicesLoading = false;
      newState.servicesError = null;
      newState.services = listServicesModel;
      return newState;

    case SERVICES_LIST_FAILURE:
      newState.servicesLoading = false;
      newState.servicesError = null;
      newState.services = action.data;
      return newState;

    default:
      return newState;
  }
}
