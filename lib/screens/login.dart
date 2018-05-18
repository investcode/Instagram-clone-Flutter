import 'package:flutter/material.dart';
import 'package:validator/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramclone/api/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: new Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instagram',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              _emailField(),
              Padding(padding: new EdgeInsets.only(bottom: 16.0)),
              _passwordField(),
              Padding(padding: new EdgeInsets.only(bottom: 16.0)),
              _submitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RawMaterialButton(
        padding: const EdgeInsets.all(20.0),
        onPressed: () {
          print("signup");
        },
        child: Text('Don\'t have an account ? Signup.'),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      autocorrect: false,
      decoration: InputDecoration(
          prefixIcon: new Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.email),
          ),
          hintText: 'Email',
          filled: true,
          fillColor: Colors.grey.shade100,
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0))),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (String email) {
        _email = email;
      },
      validator: (value) {
        if (!isEmail(value)) {
          return 'Please enter Valid email';
        }
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: new Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.lock),
          ),
          hintText: 'Password',
          filled: true,
          fillColor: Colors.grey.shade100,
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0))),
      autofocus: false,
      keyboardType: TextInputType.text,
      onSaved: (String password) {
        _password = password;
      },
      validator: (value) {
        if (!isLength(value, 5)) {
          return 'Please enter password logner than 5 char';
        }
      },
    );
  }

  Widget _submitButton() {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 60.0,
      child: OutlineButton(
        borderSide: BorderSide(style: BorderStyle.solid, color: Colors.blue),
        onPressed: () async {
          if (_formkey.currentState.validate()) {
            _formkey.currentState.save();
            FirebaseAuthantication firebaseAuthantication =
                FirebaseAuthantication(email: _email, password: _password);
            FirebaseUser firebaseUser = await firebaseAuthantication.signUp();
            print(firebaseUser);
          }
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 16.0, color: Colors.blue),
        ),
      ),
    );
  }
}