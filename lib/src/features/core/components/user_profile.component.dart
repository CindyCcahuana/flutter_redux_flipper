import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/avatar_account.component.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/features/session/redux/session.state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class UserProfileComponent extends StatelessWidget {
  const UserProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SessionState>(
      converter: (Store<AppState> store) => store.state.session!,
      builder: (BuildContext context, SessionState sessionState) {
        if (sessionState.loading == true) return Container();
        if (sessionState.error?.isNotEmpty == true) {
          return const Text('error getting services');
        }
        if (sessionState.user?.id?.isNotEmpty == true) {
          UserModel user = sessionState.user!;
          return AvatarAccountComponent(
            image: '${user.avatar}',
            fullname: '${user.name} ${user.lastName}',
          );
        }
        return Container();
      },
    );
  }
}
