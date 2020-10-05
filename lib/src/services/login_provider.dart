import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;

  UserRepository.instance() : _auth = FirebaseAuth.instance {
    _auth..authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  User get user => _user;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> aaddUser() {
    return users
        .doc(user.uid)
        .set({'full_name': "Mary Jane", 'age': 18})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addUserData(String confirmationMessage, String collectionPath,
      String adetails, String aadetails) {
    return users
        .doc(user.uid)
        .collection(collectionPath)
        .add({'full_name': "Mary Jane", 'age': 18})
        .then((value) => print('$confirmationMessage: $value'))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((currentUser) => users
                  .doc(currentUser.user.uid)
                  .get()
                  .then((DocumentSnapshot result) {
                if (result.exists) {
                  print('Document exists on the database');
                }
              }));
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(
      String email, String password, String name, String phone) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((currentUser) => users
              .doc(currentUser.user.uid)
              .set({
                'full_name': name,
                'age': 18,
                'password': password,
                'email': email,
                'phone': phone,
                'uid': currentUser.user.uid
              })
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error")));
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
     print(user.uid);
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
