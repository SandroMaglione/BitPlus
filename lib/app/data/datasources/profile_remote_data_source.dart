import 'package:bitplus/app/data/models/sign_up_user.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/database/collections.dart';
import 'package:bitplus/core/error/exceptions.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  Future<String> signInEmailAndPassword(
    String email,
    String password,
  );
  Future<User> signInGoogle();
  Future<void> signOut();
  Future<User> signUp(
    SignUpUser signUpUser,
  );
  Future<User> getSignedInUser(String uid);

  Future<User> signInFacebook();
  Future<User> signUpGoogle();
  Future<User> signUpFacebook();
  Future<User> addExperience(int experience);
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
    } catch (e) {
      throw FirebaseAuthException(500);
    }
  }

  @override
  Future<User> getSignedInUser(String uid) async {
    try {
      final userData = await firestore
          .collection(USER_COLLECTION)
          .document(
            uid,
          )
          .get();

      if (userData.exists) {
        final user = _createUserFromUserData(
          uid,
          userData.data,
        );
        return user;
      } else {
        throw FirebaseAuthException(503);
      }
    } catch (e) {
      throw FirebaseAuthException(503);
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
  Future<User> signUp(
    SignUpUser signUpUser,
  ) async {
    try {
      final reqBody = signUpUser.toJsonString();
      final resp = await client.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/storeUserProfile',
        headers: {'Content-Type': 'application/json'},
        body: reqBody,
      );

      if (resp.statusCode == 200) {
        return _createUserFromId(
          resp.body,
          signUpUser.areas,
        );
      } else {
        throw FirebaseAuthException(502);
      }
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

  @override
  Future<User> signInFacebook() async {
    // TODO: implement signInFacebook
    return null;
  }

  @override
  Future<User> signInGoogle() async {
    // TODO: implement signInGoogle
    return null;
  }

  @override
  Future<User> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  User _createUserFromId(String uid, BuiltList<int> areas) => User(
        (u) => u
          ..userID = uid
          ..experience = 0
          ..level = 1
          ..areas = ListBuilder<int>(areas),
      );

  User _createUserFromUserData(String uid, Map<String, dynamic> userData) {
    userData['userID'] = uid;
    return User.fromJsonMap(userData);
  }
}
