import 'package:mnsolutions/src/common/models/address_model.dart';

class AddressState {
  AddressModel? addressForm;

  bool? saveAddressLoading;
  bool? saveAddressSuccess;
  bool? saveAddressFailure;

  AddressState({
    this.addressForm,
    this.saveAddressLoading,
    this.saveAddressSuccess,
    this.saveAddressFailure,
  });

  factory AddressState.initial() => AddressState(
        addressForm: AddressModel(),
        saveAddressLoading: false,
        saveAddressSuccess: false,
        saveAddressFailure: false,
      );

  Map<String, dynamic> toMap() => {};
}
