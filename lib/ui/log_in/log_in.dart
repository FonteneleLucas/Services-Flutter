import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:serviceflutter/model/User.dart';
import 'package:serviceflutter/constants/application_constants.dart';


enum FormMode { LOGIN, SIGNUP }

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final FormState form = _globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  Future<void> _validateAndSubmit() async {
    setState(() {
      _errorMessage = '';
      _isLoading = true;
    });
    if (_validateAndSave()) {
      final User user = User(_email, _password, _email);

      ParseResponse response;
      try {
        if (_formMode == FormMode.LOGIN) {
          response = await user.login();
          print('Signed in');
        } else {
          response = await user.signUp();
          print('Signed up user:');
        }
        setState(() {
          _isLoading = false;
        });
        if (response.success) {
          if (_formMode == FormMode.LOGIN) {
            Navigator.pop(context, true);
          }
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = response.error.toString();
          });
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = '';
    _isLoading = false;
    super.initState();
    initData();
  }

  void _changeFormToSignUp() {
    _globalKey.currentState.reset();
    _errorMessage = '';
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _globalKey.currentState.reset();
    _errorMessage = '';
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  Future<void> initData() async {
    // Initialize repository

    // Initialize parse
    await Parse().initialize(keyParseApplicationId, keyParseServerUrl,
        masterKey: keyParseMasterKey,
        debug: true,
        coreStore: await CoreStoreSharedPrefsImp.getInstance());

    //parse serve with secure store and desktop support

    //    Parse().initialize(keyParseApplicationId, keyParseServerUrl,
    //        masterKey: keyParseMasterKey,
    //        debug: true,
    //        coreStore: CoreStoreSharedPrefsImp.getInstance());

    // Check server is healthy and live - Debug is on in this instance so check logs for result
    final ParseResponse response = await Parse().healthCheck();


  }




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
              FlutterLogo(),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
                validator: (String value) =>
                value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (String value) => _email = value,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
                validator: (String value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (String value) => _password = value,
              ),
              RaisedButton(
                child: Text('Entrar'),
                onPressed: _validateAndSubmit,
              ),
              OutlineButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}