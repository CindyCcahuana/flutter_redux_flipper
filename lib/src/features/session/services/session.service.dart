import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/common/services/firestore.service.dart';
import 'package:mnsolutions/src/features/session/services/auth.service.dart';

class SessionService {
  Future<String> loginAnonymoysly() async {
    var uuid = await AuthService().signInAnonymously();
    await FirestoreService().post(
      'user',
      UserModel(id: uuid, isAnonymous: true).toJson(),
      params: {"id": uuid},
    );
    return uuid;
  }

  Future<String> login(String email, String password) {
    return AuthService().signInEmail(email, password);
  }

  Future<String> loginGoogle() {
    return AuthService().signInGoogle();
  }

  Future<String> loginFacebook() {
    return AuthService().signInFacebook();
  }

  Future<String> register(String email, String password) async {
    var uuid = await AuthService().register(email, password);
    await FirestoreService()
        .post('user', UserModel(id: uuid).toJson(), params: {"id": uuid});
    return uuid;
  }

  Future<String> registerGoogle() async {
    var uuid = await AuthService().signInGoogle();
    await FirestoreService()
        .post('user', UserModel(id: uuid).toJson(), params: {"id": uuid});
    return uuid;
  }

  Future<String> registerFacebook() async {
    var uuid = await AuthService().signInFacebook();
    await FirestoreService()
        .post('user', UserModel(id: uuid).toJson(), params: {"id": uuid});
    return uuid;
  }

  Future<List<Map<String, dynamic>>> getUser(String userId) {
    return FirestoreService().get('user', params: {"id": userId});
  }

  Future updateUser(String userId, String data) {
    return FirestoreService().patch('user', body: data, params: {"id": userId});
  }
}
