import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/service_request.component.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/core/redux/core_state.dart';
import 'package:mnsolutions/src/features/request/redux/service_thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class HistoryScreen extends StatelessWidget {
  static const String route = '/core/history';

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FractionallySizedBoxComponent(
          child: StoreConnector<AppState, CoreState>(
            converter: (Store<AppState> store) => store.state.core!,
            builder: (BuildContext context, CoreState coreState) {
              if (coreState.serviceRequestsLoading == true) return Container();
              if (coreState.serviceRequestsError == true) {
                return const Text('error getting service requests');
              }
              if (coreState.serviceRequests?.isNotEmpty == true) {
                return ListView.builder(
                  itemCount: coreState.serviceRequests?.length,
                  itemBuilder: (BuildContext context, int index) {
                    ServiceRequestModel serviceRequest =
                        coreState.serviceRequests![index];
                    return ServiceRequestComponent(
                      video: serviceRequest.video,
                      title: serviceRequest.service!.title!,
                      description: serviceRequest.description!,
                      state: serviceRequest.state!.description!,
                      onTap: () {
                        final store = StoreProvider.of<AppState>(context);
                        store.dispatch(showRequestDetail(serviceRequest));
                      },
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
