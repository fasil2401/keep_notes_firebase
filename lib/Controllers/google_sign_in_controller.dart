import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  GoogleSignInAccount? get currentUser => _currentUser;

  Future signIn() async {

    try {
      final googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount == null) return;
    _currentUser = googleSignInAccount;

    final googleAuth = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();

  }

  Future logout() async {
    await googleSignIn.disconnect();
   FirebaseAuth.instance.signOut();
    // notifyListeners();
  }

}
