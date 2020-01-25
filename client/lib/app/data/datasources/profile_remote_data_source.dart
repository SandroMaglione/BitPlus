import 'dart:convert';

import 'package:bitplus/app/data/models/api/post_user_account.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/database/collections.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  /// Sign in user with credentials, returns uid
  Future<String> signInEmailAndPassword(
    String email,
    String password,
  );

  /// Sign in user with Google, returns firebase auth user data
  Future<FirebaseUser> signInGoogle();

  /// Sign out user both from auth and google
  Future<void> signOut();

  /// Sign up user with credentials and areas preferences
  Future<String> signUpCredentials(
    String email,
    String password,
  );

  /// Get user information from remote database
  Future<User> getSignedInUser();

  /// Returns [bool] true if user currently signed in
  Future<bool> isSignedInUser();

  /// Store user account data and return generated uid
  Future<User> createAccount(
    String uid,
    String email,
    BuiltList<int> areas,
  );
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Firestore firestore;
  final http.Client client;

  const ProfileRemoteDataSourceImpl({
    @required this.firebaseAuth,
    @required this.firestore,
    @required this.googleSignIn,
    @required this.client,
  });

  @override
  Future<String> signInEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user.uid;
    } on PlatformException {
      throw const FirebaseAuthFailure(
        message: 'No user exist with this credentials, try again',
      );
    }
  }

  @override
  Future<User> getSignedInUser() async {
    final userAuth = await firebaseAuth.currentUser();

    if (userAuth != null) {
      final userData = await firestore
          .collection(USER_COLLECTION)
          .document(userAuth.uid)
          .get();

      if (userData.exists) {
        userData.data.remove('dateCreated');
        final user = _createUserFromUserData(
          userAuth.uid,
          userData.data,
        );
        return user;
      } else {
        throw const FirebaseAuthFailure(
          message: 'No user exist with this credentials',
        );
      }
    } else {
      return null;
    }
  }

  @override
  Future<void> signOut() async => await Future.wait(
        [
          firebaseAuth.signOut(),
          googleSignIn.signOut(),
        ],
      );

  @override
  Future<User> createAccount(
    String uid,
    String email,
    BuiltList<int> areas,
  ) async {
    final reqBody = PostUserAccount(
      (p) => p
        ..uid = uid
        ..email = email
        ..areas = areas.toBuilder(),
    ).toJson();

    final resp = await client.post(
      'https://us-central1-bitplus-95304.cloudfunctions.net/storeUserProfile',
      headers: {'Content-Type': 'application/json'},
      body: reqBody,
    );

    if (resp.statusCode != 200) {
      throw FirebaseAuthFailure(
        message:
            'Error while creating account, try again (Error code ${resp.statusCode})',
      );
    } else {
      return _createUserFromId(
        uid,
        email,
        areas,
      );
    }
  }

  @override
  Future<String> signUpCredentials(
    String email,
    String password,
  ) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user.uid;
  }

  @override
  Future<bool> isSignedInUser() async {
    final currentUser = await firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future<FirebaseUser> signInGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
      final user = await firebaseAuth.currentUser();
      return user;
    } on PlatformException catch (e) {
      throw FirebaseAuthFailure(
        message: e.message,
      );
    }
  }

  /// Instantiate a [User] object given its attributes
  User _createUserFromId(
    String uid,
    String email,
    BuiltList<int> areas,
  ) =>
      User(
        (u) => u
          ..uid = uid
          ..email = email
          ..areas = areas.toBuilder(),
      );

  /// Decode user data and instantiate [User] from json
  User _createUserFromUserData(String uid, Map<String, dynamic> userData) {
    userData['uid'] = uid;
    return User.fromJson(
      json.encode(userData),
    );
  }
}
