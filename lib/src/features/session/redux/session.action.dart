import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/features/session/redux/session.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: LOGIN_REQUEST,
        ));

ThunkAction<AppState> loginSuccessAction(UserModel data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: LOGIN_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> loginFailureAction(String? error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: LOGIN_FAILURE,
          data: error,
        ));

ThunkAction<AppState> updateSessionRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: UPDATE_SESSION_REQUEST,
        ));

ThunkAction<AppState> updateSessionSuccessAction(UserModel data) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: UPDATE_SESSION_SUCCESS,
          data: data,
        ));

ThunkAction<AppState> updateSessionFailureAction(String? error) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: UPDATE_SESSION_FAILURE,
          data: error,
        ));
