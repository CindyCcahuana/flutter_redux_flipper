import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/common/screens/loading/loading_screen.dart';
import 'package:mnsolutions/src/features/address/screens/district/district_screen.dart';
import 'package:mnsolutions/src/features/core/redux/core_thunk.dart';
import 'package:mnsolutions/src/features/core/screens/home/home_screen.dart';
import 'package:mnsolutions/src/features/session/redux/session.action.dart';
import 'package:mnsolutions/src/features/session/services/session.service.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginAnonymoysly() => (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().loginAnonymoysly();
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> loginUser(String user, String password) =>
    (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().login(user, password);
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> loginGoogle() => (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().loginGoogle();
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> loginFacebook() => (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().loginFacebook();
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> registerUser(String user, String password) =>
    (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().register(user, password);
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> registerGoogle() => (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().registerGoogle();
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> registerFacebook() => (Store<AppState> store) async {
      try {
        store.dispatch(NavigateToAction.push(LoadingScreen.route));
        String userId = await SessionService().registerFacebook();
        store.dispatch(initializeSession(userId));
      } on Exception catch (e) {
        store.dispatch(NavigateToAction.pop());
        store.dispatch(loginFailureAction(e.toString()));
      }
    };

ThunkAction<AppState> initializeSession(String userId) =>
    (Store<AppState> store) async {
      var data = await SessionService().getUser(userId);
      var user = UserModel.fromMap(data[0]);
      await store.dispatch(loginSuccessAction(user));
      if (user.addresses?.isNotEmpty == true) {
        store.dispatch(NavigateToAction.pushNamedAndRemoveUntil(
          HomeScreen.route,
          (route) => false,
        ));
      } else {
        store.dispatch(NavigateToAction.pushNamedAndRemoveUntil(
          DistrictScreen.route,
          (route) => false,
        ));
      }
    };

ThunkAction<AppState> updateSession(UserModel user) =>
    (Store<AppState> store) async {
      try {
        store.dispatch(updateSessionRequestAction());
        UserModel newUser = store.state.session!.user!.copyWith(
          id: user.id,
          avatar: user.avatar,
          name: user.name,
          lastName: user.lastName,
          phone: user.phone,
          dateSuscription: user.dateSuscription,
          numberSuscription: user.numberSuscription,
          rol: user.rol,
          address: user.address,
          addresses: user.addresses,
        );
        String userId = store.state.session!.user!.id!;
        await SessionService().updateUser(userId, newUser.toJson());
        store.dispatch(updateSessionSuccessAction(newUser));
      } on Exception catch (e) {
        store.dispatch(updateSessionFailureAction(e.toString()));
      }
    };
