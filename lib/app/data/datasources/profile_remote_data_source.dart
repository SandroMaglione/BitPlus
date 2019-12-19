import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/error_messages.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, User>> signInEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, User>> signInGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User>> signUp(
    String email,
    String password,
  );
  
  Future<Either<Failure, User>> signInFacebook();
  Future<Either<Failure, User>> signUpGoogle();
  Future<Either<Failure, User>> signUpFacebook();
  Future<Either<Failure, User>> addExperience(int experience);
  Future<Either<Failure, User>> getUserRemote(String uid);
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
  Future<Either<Failure, User>> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  @override
  Future<Either<Failure, User>> getUserRemote(String uid) {
    // TODO: implement getUserRemote
    return null;
  }

  @override
  Future<Either<Failure, User>> signInEmailAndPassword(
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
      return Left(
        FirebaseAuthFailure(
          message: ERROR_SIGN_IN_EMAIL,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signInFacebook() async {
    // TODO: implement signInFacebook
    return null;
  }

  @override
  Future<Either<Failure, User>> signInGoogle() async {
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
      return Left(
        FirebaseAuthFailure(
          message: ERROR_SIGN_IN_GOOGLE,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(
        await firebaseAuth.signOut(),
      );
    } catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: ERROR_SIGN_OUT,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _createUserIfNotNull(result.user);
    } catch (e) {
      throw FirebaseAuthFailure(
        message: ERROR_SIGN_UP_EMAIL,
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUpFacebook() {
    // TODO: implement signUpFacebook
    return null;
  }

  @override
  Future<Either<Failure, User>> signUpGoogle() {
    // TODO: implement signUpGoogle
    return null;
  }

  Either<Failure, User> _createUserIfNotNull(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      return Left(
        FirebaseAuthFailure(
          message: NO_USER_SIGN_IN,
        ),
      );
    }

    final userID = firebaseUser.uid;
    // TODO: Add also user experience and level on sign in
    final user = User(
      (u) => u
        ..userID = userID
        ..experience = 0
        ..level = 1,
    );
    return Right(user);
  }
}
