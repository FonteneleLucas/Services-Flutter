import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: <String, WidgetBuilder>{
    '/homePage': (BuildContext context) => new HomePage(),
  },
  home: new HomePage(),
//    home: new ShowData()
));
