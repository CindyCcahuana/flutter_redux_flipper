import 'package:flutter/material.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  debugPrint('${DateTime.now()}: $action');
  next(action);
}
