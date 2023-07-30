import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/features/address/redux/address.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> addressFormAction(AddressModel address) =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: ADDRESS_FORM,
          data: address,
        ));

ThunkAction<AppState> saveAddressRequestAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SAVE_ADDRESS_REQUEST,
        ));

ThunkAction<AppState> saveAddressSuccessAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SAVE_ADDRESS_SUCCESS,
        ));

ThunkAction<AppState> saveAddressFailureAction() =>
    (Store<AppState> store) => store.dispatch(ResponseModal(
          type: SAVE_ADDRESS_FAILURE,
        ));
