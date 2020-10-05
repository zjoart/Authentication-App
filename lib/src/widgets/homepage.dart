
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelui/src/screens/galeery.dart';
import 'package:travelui/src/services/login_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
     Text(user.email),
     Text(user.uid),
     RaisedButton(
         child: Text("SIGN OUT"),
         onPressed: () => Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => GalerryScreen()))),
     RaisedButton(
       child: Text("SIGN OUT"),
       onPressed: () =>
           Provider.of<UserRepository>(context, listen: false).signOut(),
     )
          ],
        );
  }
}