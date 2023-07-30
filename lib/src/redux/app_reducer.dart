import 'package:mnsolutions/src/features/address/redux/address.reducer.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.reducer.dart';
import 'package:mnsolutions/src/features/core/redux/core_reducer.dart';
import 'package:mnsolutions/src/features/request/redux/service_reducer.dart';
import 'package:mnsolutions/src/features/session/redux/session.reducer.dart';
import 'package:mnsolutions/src/redux/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    core: coreReducer(state.core!, action),
    service: serviceReducer(state.service!, action),
    session: sessionReducer(state.session!, action),
    checkout: checkoutReducer(state.checkout!, action),
    address: addressReducer(state.address!, action),
  );
}
