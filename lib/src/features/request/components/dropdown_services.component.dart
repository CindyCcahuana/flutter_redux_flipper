import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/dropdown_form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class DropdownServicesComponent extends StatelessWidget {
  const DropdownServicesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (BuildContext context, AppState appState) {
        if (appState.core?.servicesLoading == true) return Container();
        if (appState.core?.servicesError == true) {
          return const Text('error getting services');
        }
        if (appState.core?.services?.isNotEmpty == true) {
          var services = appState.core?.services;
          return FractionallySizedBoxComponent(
            child: DropdownFormComponent(
              value: appState.service?.serviceRequestForm?.service?.id,
              items: services?.map((service) {
                return DropdownMenuItem(
                  value: service.id,
                  child: Text(
                    '${service.title}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                final store = StoreProvider.of<AppState>(context);
                store.dispatch(
                  requestServiceFormAction(ServiceRequestModel(
                    service:
                        services?.firstWhere((element) => element.id == value),
                  )),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
