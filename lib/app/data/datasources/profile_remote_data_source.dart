import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/error_messages.dart';
import 'package:bitplus/core/error/exceptions.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDataSource {
  Future<User> signInEmailAndPassword(
    String email,
    String password,
  );
  Future<User> signInGoogle();
  Future<void> signOut();
  Future<User> signUp(
    String email,
    String password,
  );

  Future<User> signInFacebook();
  Future<User> signUpGoogle();
  Future<User> signUpFacebook();
  Future<User> addExperience(int experience);
  Future<User> getUserRemote(String uid);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Firestore firestore;

  const ProfileRemoteDataSourceImpl({
    @required this.firebaseAuth,
    @required this.firestore,
    @required this.googleSignIn,
  });

  @override
  Future<User> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  @override
  Future<User> getUserRemote(String uid) {
    // TODO: implement getUserRemote
    return null;
  }

  @override
  Future<User> signInEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _createUserIfNotNull(result.user);
    } catch (e) {
      throw FirebaseAuthException(500);
    }
  }

  @override
  Future<User> signInFacebook() async {
    // TODO: implement signInFacebook
    return null;
  }

  @override
  Future<User> signInGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await firebaseAuth.signInWithCredential(credential);
      return _createUserIfNotNull(result.user);
    } catch (e) {
      throw FirebaseAuthException(500);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      throw FirebaseAuthException(501);
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _createUserIfNotNull(result.user);
    } catch (e) {
      throw FirebaseAuthException(502);
    }
  }

  @override
  Future<User> signUpFacebook() {
    // TODO: implement signUpFacebook
    return null;
  }

  @override
  Future<User> signUpGoogle() {
    // TODO: implement signUpGoogle
    return null;
  }

  User _createUserIfNotNull(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      throw FirebaseAuthException(500);
    }

    final userID = firebaseUser.uid;
    // TODO: Add also user experience and level on sign in
    final user = User(
      (u) => u
        ..userID = userID
        ..experience = 0
        ..level = 1,
    );
    return user;
  }
}
