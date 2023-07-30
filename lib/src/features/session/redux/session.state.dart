import 'dart:convert';
import 'package:mnsolutions/src/common/models/user_model.dart';

class SessionState {
  UserModel? user;
  bool? loading;
  bool? success;
  bool? failure;
  String? error;

  SessionState({
    this.user,
    this.loading,
    this.success,
    this.failure,
    this.error,
  });

  factory SessionState.initial() => SessionState();

  SessionState copyWith({
    UserModel? user,
    bool? loading,
    bool? success,
    bool? failure,
    String? error,
  }) =>
      SessionState(
        user: user ?? this.user,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        failure: failure ?? this.failure,
        error: error ?? this.error,
      );

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is SessionState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      "LoginState { loading: $loading, success: $success, failure: $failure, error: $error}";

  factory SessionState.fromMap(Map<String, dynamic> data) => SessionState(
        user: data['user'] != null ? UserModel.fromMap(data['user']) : null,
        loading: data['loading'] as bool?,
        success: data['success'] as bool?,
        failure: data['failure'] as bool?,
        error: data['error'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'loading': loading,
        'success': success,
        'failure': failure,
        'error': error,
      };

  factory SessionState.fromJson(String data) {
    return SessionState.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
