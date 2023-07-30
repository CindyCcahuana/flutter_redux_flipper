import 'package:mnsolutions/src/features/address/redux/address.state.dart';
import 'package:mnsolutions/src/features/address/redux/address.type.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';

AddressState addressReducer(AddressState state, ResponseModal action) {
  AddressState newState = state;

  switch (action.type) {
    case ADDRESS_FORM:
      newState.addressForm = newState.addressForm?.copyWith(
        id: action.data.id,
        district: action.data.district,
        address: action.data.address,
        reference: action.data.reference,
        ruc: action.data.ruc,
        idUser: action.data.idUser,
      );
      return newState;

    case SAVE_ADDRESS_REQUEST:
      newState.saveAddressLoading = true;
      newState.saveAddressSuccess = false;
      newState.saveAddressFailure = false;
      return newState;

    case SAVE_ADDRESS_SUCCESS:
      newState.saveAddressLoading = false;
      newState.saveAddressSuccess = true;
      newState.saveAddressFailure = false;
      return newState;

    case SAVE_ADDRESS_FAILURE:
      newState.saveAddressLoading = false;
      newState.saveAddressSuccess = false;
      newState.saveAddressFailure = true;
      return newState;

    default:
      return newState;
  }
}
