import 'package:mnsolutions/src/features/request/redux/service_state.dart';
import 'package:mnsolutions/src/features/request/redux/service_type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';

ServiceState serviceReducer(ServiceState state, ResponseModal action) {
  ServiceState newState = state;
  switch (action.type) {
    case REQUEST_SERVICE_DETAIL:
      newState.serviceRequestDetail = action.data;
      return newState;

    case REQUEST_SERVICE_FORM:
      newState.serviceRequestForm = state.serviceRequestForm?.copyWith(
            user: action.data.user,
            video: action.data.video,
            description: action.data.description,
            dateIncident: action.data.dateIncident,
            address: action.data.address,
            service: action.data.service,
            state: action.data.state,
          ) ??
          action.data;
      return newState;

    case REQUEST_SERVICE_REQUEST:
      newState.serviceRequestLoading = true;
      newState.serviceRequestSuccess = false;
      newState.serviceRequestFailure = false;
      return newState;

    case REQUEST_SERVICE_SUCCESS:
      newState.serviceRequestLoading = false;
      newState.serviceRequestSuccess = true;
      newState.serviceRequestFailure = false;
      return newState;

    case REQUEST_SERVICE_FAILURE:
      newState.serviceRequestLoading = false;
      newState.serviceRequestSuccess = false;
      newState.serviceRequestFailure = true;
      return newState;

    default:
      return newState;
  }
}
