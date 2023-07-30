import 'package:mnsolutions/src/features/session/redux/session.state.dart';
import 'package:mnsolutions/src/features/session/redux/session.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';

SessionState sessionReducer(SessionState state, ResponseModal action) {
  SessionState newState = state;

  switch (action.type) {
    case LOGIN_REQUEST:
      newState.loading = true;
      newState.success = false;
      newState.failure = false;
      newState.error = '';
      return newState;

    case LOGIN_SUCCESS:
      newState.user = action.data;
      newState.loading = false;
      newState.success = true;
      newState.failure = false;
      newState.error = '';
      return newState;

    case LOGIN_FAILURE:
      newState.loading = false;
      newState.success = false;
      newState.failure = true;
      newState.error = action.data;
      return newState;

    case UPDATE_SESSION_REQUEST:
      newState.loading = true;
      newState.success = false;
      newState.failure = false;
      newState.error = '';
      return newState;

    case UPDATE_SESSION_SUCCESS:
      newState.loading = false;
      newState.success = true;
      newState.failure = false;
      newState.error = '';
      newState.user = newState.user?.copyWith(
        id: action.data.id,
        avatar: action.data.avatar,
        name: action.data.name,
        lastName: action.data.lastName,
        phone: action.data.phone,
        dateSuscription: action.data.dateSuscription,
        numberSuscription: action.data.numberSuscription,
        rol: action.data.rol,
        address: action.data.address,
        addresses: action.data.addresses,
      );
      return newState;

    case UPDATE_SESSION_FAILURE:
      newState.loading = false;
      newState.success = false;
      newState.failure = true;
      newState.error = action.data;
      return newState;

    default:
      return newState;
  }
}
