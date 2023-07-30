import 'dart:io';
import 'package:flipperkit_redux_middleware/flipperkit_redux_middleware.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/src/redux/app_middleware.dart';
import 'package:mnsolutions/src/redux/app_reducer.dart';
import 'package:mnsolutions/src/redux/app_response_modal.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/state.json');
}

Future<Store<AppState>> createStore() async {
  final persistor = Persistor<AppState>(
    storage: FileStorage(await _localFile),
    serializer: JsonSerializer<AppState>(AppState.fromDynamicJson),
    debug: true,
  );

  AppState? initialState;

  try {
    initialState = await persistor.load();
  } on Exception catch (error) {
    initialState = null;
  }

  return Store<AppState>(
    combineReducers([
      TypedReducer<AppState, ResponseModal>(appReducer),
    ]),
    initialState: initialState ?? AppState.initial(),
    middleware: [
      const NavigationMiddleware(),
      thunkMiddleware,
      loggingMiddleware,
      persistor.createMiddleware(),
      FlipperKitReduxMiddleware(
        filter: (actionType) {
          return actionType.startsWith('\$');
        },
        getActionType: (action) {
          return action.toString();
        },
        payloadConverter: (payload) {},
        stateConverter: (state) {},
      )
    ],
  );
}
