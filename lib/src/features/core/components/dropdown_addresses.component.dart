import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/dropdown_form.component.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/features/session/redux/session.action.dart';
import 'package:mnsolutions/src/features/session/redux/session.state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class DropdownAddressesComponent extends StatelessWidget {
  const DropdownAddressesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SessionState>(
      converter: (Store<AppState> store) => store.state.session!,
      builder: (BuildContext context, SessionState sessionState) {
        if (sessionState.loading == true) return Container();
        if (sessionState.error?.isNotEmpty == true) {
          return const Text('Error getting services');
        }
        if (sessionState.user?.addresses?.isNotEmpty == true) {
          AddressModel currentAddress = sessionState.user!.address!;
          List<AddressModel> addresses = sessionState.user!.addresses!;
          return DropdownFormComponent(
            value: currentAddress.id,
            items: addresses.map((address) {
              return DropdownMenuItem(
                value: address.id,
                child: Text(
                  address.address!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
            onChanged: (value) {
              final store = StoreProvider.of<AppState>(context);
              store.dispatch(updateSessionSuccessAction(UserModel(
                address: addresses.firstWhere((element) => element.id == value),
              )));
            },
          );
        }
        return Container();
      },
    );
  }
}
