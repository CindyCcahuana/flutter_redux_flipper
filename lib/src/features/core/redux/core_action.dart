import 'package:mnsolutions/src/common/models/banner_model.dart';
import 'package:mnsolutions/src/features/core/redux/core_type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> bannerListRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: BANNER_LIST_REQUEST,
        ));

ThunkAction<AppState> bannerListSuccessAction(List<BannerModel> data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: BANNER_LIST_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> bannerListFailureAction(String? error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: BANNER_LIST_FAILURE,
          data: error,
        ));

ThunkAction<AppState> requestServiceListRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_LIST_REQUEST,
        ));

ThunkAction<AppState> requestServiceListSuccessAction(
        List<Map<String, dynamic>> data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_LIST_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> requestServiceListFailureAction(String error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: REQUEST_SERVICE_LIST_FAILURE,
          data: error,
        ));

ThunkAction<AppState> servicesListRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SERVICES_LIST_REQUEST,
        ));

ThunkAction<AppState> servicesListSuccessAction(
        List<Map<String, dynamic>> data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SERVICES_LIST_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> servicesListFailureAction(String error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SERVICES_LIST_FAILURE,
          data: error,
        ));
