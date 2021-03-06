import 'package:meta/meta.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthantication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String email;
  final String password;
  FirebaseAuthantication({@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  Future<FirebaseUser> signUp() async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user);
    return user;
  }

  Future<FirebaseUser> signIn() async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }
}
