import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FlutterflowFirebaseUser {
  FlutterflowFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FlutterflowFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FlutterflowFirebaseUser> flutterflowFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<FlutterflowFirebaseUser>(
        (user) => currentUser = FlutterflowFirebaseUser(user));
