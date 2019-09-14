import 'package:flutter/material.dart';
import 'package:serviceflutter/ui/log_in/log_in.dart';
import 'package:serviceflutter/ui/sign_up/sign_up.dart';
import 'package:serviceflutter/ui/dashboard/dashboard.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: <String, WidgetBuilder>{
    '/dashboard': (BuildContext context) => new Dashboard(),
    '/logIn': (BuildContext context) => new LogIn(),
    '/signUp': (BuildContext context) => new SignUp(),
  },
  home: new LogIn(),
//    home: new ShowData()
));
