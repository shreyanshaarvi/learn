import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WallpaperFirebaseUser {
  WallpaperFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WallpaperFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WallpaperFirebaseUser> wallpaperFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WallpaperFirebaseUser>(
      (user) {
        currentUser = WallpaperFirebaseUser(user);
        return currentUser!;
      },
    );
