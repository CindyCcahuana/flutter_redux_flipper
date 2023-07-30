import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/common/screens/loading/loading_screen.dart';
import 'package:mnsolutions/src/features/address/redux/addres.action.dart';
import 'package:mnsolutions/src/features/address/services/address.service.dart';
import 'package:mnsolutions/src/features/core/screens/home/home_screen.dart';
import 'package:mnsolutions/src/features/session/redux/session.thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> saveAddress() => (Store<AppState> store) async {
      try {
        store.dispatch(saveAddressRequestAction());
        store.dispatch(NavigateToAction.replace(LoadingScreen.route));
        AddressModel address = store.state.address!.addressForm!;
        String id = await AddressService().postAddress(address.toJson());
        address = address.copyWith(id: id);
        UserModel user = store.state.session!.user!.copyWith(
          address: address,
          addresses: [
            ...store.state.session!.user!.addresses ?? [],
            address,
          ],
        );
        store.dispatch(updateSession(user));
        store.dispatch(NavigateToAction.replace(HomeScreen.route));
        store.dispatch(saveAddressSuccessAction());
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(saveAddressFailureAction());
      }
    };
