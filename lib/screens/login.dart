import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:instagramclone/api/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: Center(
          child: FloatingActionButton(
              onPressed: () async {
                FirebaseAuthantication firebaseAuthantication =
                    FirebaseAuthantication(
                        email: "mahmoud@me.com", password: "mahmoud@me.com");
                FirebaseUser user = await firebaseAuthantication.signIn();
                print(user.toString());
                // .of(context).pushNamed('home-page');
              },
              child: Icon(Icons.arrow_right))),
    );
  }
}
