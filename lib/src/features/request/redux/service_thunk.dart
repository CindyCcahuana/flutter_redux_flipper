import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/common/models/state_model.dart';
import 'package:mnsolutions/src/common/screens/loading/loading_screen.dart';
import 'package:mnsolutions/src/features/core/redux/core_thunk.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/features/request/screens/request/request.screen.dart';
import 'package:mnsolutions/src/features/request/screens/result/result_screen.dart';
import 'package:mnsolutions/src/features/request/services/service_service.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> sendRequestService(String? videoPath) =>
    (Store<AppState> store) async {
      try {
        store.dispatch(requestServiceRequestAction());
        store.dispatch(NavigateToAction.replace(LoadingScreen.route));
        ServiceRequestModel serviceRequestModel =
            store.state.service!.serviceRequestForm!;
        String? url;
        if (videoPath?.isNotEmpty == true) {
          File video = File(videoPath!);
          url = await ServiceService().putFileVideo(video);
        }
        String data = serviceRequestModel
            .copyWith(
              video: url,
              user: store.state.session!.user,
              state: StateModel(id: '01', description: 'PENDIENTE'),
            )
            .toJson();
        String saved = await ServiceService().postServiceRequest(data);

        if (saved.isNotEmpty) {
          store.dispatch(NavigateToAction.replace(ResultScreen.route));
          store.dispatch(requestServiceSuccessAction());
          store.dispatch(getRequestServicesList());
        } else {
          store.dispatch(NavigateToAction.pop());
          store.dispatch(requestServiceFailureAction("ERROR SAVING"));
        }
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(requestServiceFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> showRequestDetail(ServiceRequestModel serviceRequest) =>
    (Store<AppState> store) async {
      await store.dispatch(requestServiceDetailAction(serviceRequest));
      store.dispatch(NavigateToAction.push(RequestScreen.route));
    };
