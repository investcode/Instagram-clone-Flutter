import 'package:flutter/material.dart';
import 'package:validator/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode passwordNode = FocusNode();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Email $_email && Password $_password');
    }
  }

  String _emailValidator(String value) =>
      !isEmail(value.toString()) ? 'Please Enter a valid email.' : null;

  String _passwordValidator(String value) =>
      isNull(value) ? 'Please enter your password' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instagram',
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              Form(
                key: formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.only(top: 50.0),
                      child: TextFormField(
                        validator: (value) => _emailValidator(value),
                        onSaved: (value) => _email = value,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.email),
                          ),
                          hintText: 'Enter you Email',
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        obscureText: true,
                        focusNode: passwordNode,
                        validator: (value) => _passwordValidator(value),
                        onSaved: (value) => _password = value,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.lock),
                          ),
                          hintText: 'Enter you Password',
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: _submit,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
