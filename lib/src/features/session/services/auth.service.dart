import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<String> signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user!.uid;
  }

  Future<String> signInEmail(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  Future<String> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user!.uid;
  }

  Future<String> signInFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    return userCredential.user!.uid;
  }

  Future<String> register(String email, String password) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!.uid;
  }

  Future logout() {
    return FirebaseAuth.instance.signOut();
  }
}
