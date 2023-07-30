import 'package:mnsolutions/src/common/models/banner_model.dart';
import 'package:mnsolutions/src/features/core/redux/core_action.dart';
import 'package:mnsolutions/src/features/core/services/core_service.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> initializeCoreFlow() => (Store<AppState> store) {
      store.dispatch(getBannerList());
      store.dispatch(getServicesList());
      store.dispatch(getRequestServicesList());
    };

ThunkAction<AppState> getBannerList() => (Store<AppState> store) async {
      try {
        store.dispatch(bannerListRequestAction());
        var data = await CoreService().getBanner();
        store.dispatch(bannerListSuccessAction(
          List<BannerModel>.from(
            data.map((element) => BannerModel.fromMap(element)),
          ),
        ));
      } on Exception catch (e) {
        store.dispatch(bannerListFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> getRequestServicesList() =>
    (Store<AppState> store) async {
      store.dispatch(requestServiceListRequestAction());
      try {
        String userId = store.state.session!.user!.id!;
        var response = await CoreService().getServiceRequests(userId);
        store.dispatch(requestServiceListSuccessAction(response));
      } on Exception catch (error) {
        store.dispatch(requestServiceListFailureAction(error.toString()));
      }
    };

ThunkAction<AppState> getServicesList() => (Store<AppState> store) async {
      store.dispatch(servicesListRequestAction());
      try {
        var response = await CoreService().getServices();
        store.dispatch(servicesListSuccessAction(response));
      } on Exception catch (error) {
        store.dispatch(servicesListFailureAction(error.toString()));
      }
    };
