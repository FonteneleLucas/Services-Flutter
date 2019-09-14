import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(30),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(),
              TextFormField(),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text('Entrar'),
                onPressed: () {
                  Navigator.pushNamed(context, '/logIn');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
