import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelui/src/constants/color_con.dart';
import 'package:travelui/src/constants/responive_con.dart';
import 'package:travelui/src/services/login_provider.dart';
import 'package:travelui/src/widgets/donthaveanaccount.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 20.0);
  TextEditingController _email;
  TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  String _errorMessage = "";
  String _cname;
  String _cphone;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _key,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Center(
                child: (_formMode == FormMode.LOGIN)
                    ? Column(
                      children: [
                        Text(
                            'Welcome!🤗',
                            style: style.copyWith(
                              fontSize: SizeConfig.textSize(context, 7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            SizedBox(height: SizeConfig.yMargin(context, 2)),
                      ],
                    )
                    : Column(
                        children: [
                          SizedBox(height: SizeConfig.yMargin(context, 7)),
                          Text(
                            'Welcome Onboard!🤩',
                            style: style.copyWith(
                              fontSize: SizeConfig.textSize(context, 7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: SizeConfig.yMargin(context, 2)),
                        ],
                      )),
            (_formMode == FormMode.LOGIN) ? limageWidget() : simageWidget(),
            formWidget(),
           
          loginandSignupButton(user),
          errorWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                color: kcolor,
                thickness: 2,
              ),
            ),
            (_formMode == FormMode.LOGIN)
                ? DontHave(
                    style: style,
                    ftext: 'Dont have an account?',
                    stext: 'Create Account',
                    press: showSignupForm)
                : DontHave(
                    style: style,
                    ftext: 'Already have an account?',
                    stext: 'Login',
                    press: showLoginForm,
                  )
          ],
        ),
      ),
    );
  }

  Widget loginandSignupButton(UserRepository user) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: kcolor,
      child: MaterialButton(
        onPressed: () {
          _valiidateandSubmit(user);
        },
        child: user.status == Status.Authenticating
                ? Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )) : _formMode == FormMode.LOGIN
            ? Text(
                "Login",
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            : Text(
                "Create Account",
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _valiidateandSubmit(UserRepository user) async {
    if (_validateAndSave()) {
      try {
        if (_formMode == FormMode.LOGIN) {
          await user.signIn(_email.text, _password.text);
        } else {
          if (_formMode == FormMode.SIGNUP) {
            await user.signUp(_email.text, _password.text, _cname, _cphone);
          }
        }
      } catch (e) {
        setState(() {
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  Widget limageWidget() {
    return Hero(
      tag: 'hero',
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/login.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget simageWidget() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/signup.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget formWidget() {
    if (_formMode == FormMode.LOGIN) {
      return Form(
          key: _formKey,
          child: Column( children: <Widget>[
            emailField(),
            SizedBox(height: 10.0),
            passwordField(),
            SizedBox(height: 24.0),
          ]));
    } else {
      return Form(
          key: _formKey,
          child: Column(  children: <Widget>[
             SizedBox(height: 10.0),
            nameWidget(),
            SizedBox(height: 10.0),
            emailField(),
            SizedBox(height: 10.0),
            phoneWidget(),
            SizedBox(height: 10.0),
            passwordField(),
            SizedBox(height: 24.0),
          ]));
    }
  }

  Widget nameWidget() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Full Name",
          contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      validator: (value) => value.isEmpty ? 'Name can not be empty' : null,
      onSaved: (value) => _cname = value.trim(),
    );
  }

  Widget phoneWidget() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Phone Number",
          contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      validator: (value) =>
          value.isEmpty ? 'Phone number can not be empty' : null,
      onSaved: (value) => _cphone = value.trim(),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
        controller: _password,
        autofocus: false,
        validator: (value) {
          if (value.isEmpty) {
            return 'Password cannot be empty';
          }
          if (value.length < 8) {
            return 'Password must be longer than 8 characters';
          } else {
            return null;
          }
        },
        style: style,
        decoration: InputDecoration(
            prefixIcon: _formMode == FormMode.LOGIN ? Icon(Icons.lock) : null,
            labelText: 'Password*',
            hintText: "********",
            contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  TextFormField emailField() {
    return TextFormField(
        controller: _email,
        validator: (value) {
          if (value.isEmpty) {
            return 'Email cannot be empty';
          }
          {
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return 'Email format is invalid';
            } else {
              return null;
            }
          }
        },
        style: style,
        decoration: InputDecoration(
            prefixIcon: _formMode == FormMode.LOGIN ? Icon(Icons.email) : null,
            labelText: "Email",
            contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  void showSignupForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void showLoginForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  errorWidget() {
    double width = MediaQuery.of(context).size.width;
    if (_errorMessage.length > 0 && _errorMessage != null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Container(
            height: SizeConfig.yMargin(context, 15),
            width: SizeConfig.xMargin(context, width),
            child: Text(_errorMessage)),
      ));
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }
}
