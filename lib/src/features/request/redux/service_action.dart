import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/request/redux/service_type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> requestServiceDetailAction(
        ServiceRequestModel serviceRequestModel) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_DETAIL,
          data: serviceRequestModel,
        ));

ThunkAction<AppState> requestServiceFormAction(
        ServiceRequestModel serviceRequestModel) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_FORM,
          data: serviceRequestModel,
        ));

ThunkAction<AppState> requestServiceRequestAction() =>
    (Store<AppState> store) =>
        store.dispatch(ResponseModal(type: REQUEST_SERVICE_REQUEST));

ThunkAction<AppState> requestServiceSuccessAction() =>
    (Store<AppState> store) =>
        store.dispatch(ResponseModal(type: REQUEST_SERVICE_SUCCESS));

ThunkAction<AppState> requestServiceFailureAction(String error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_FAILURE,
          data: error,
        ));
