import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e, s) {
          Crashlytics().recordFlutterError(
            FlutterErrorDetails(
              stack: s,
              exception: e,
            ),
          );
          throw obj;
        }
      }),
    );
  }
}
