import 'package:flutter/material.dart';

import 'package:instagramclone/screens/home.dart';
import 'package:instagramclone/screens/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireSore',
      routes: {
        "home-page": (context) => MyHomePage(),
        "login-page": (context) => LoginPage(),
      },
      home: LoginPage(),
    ));
