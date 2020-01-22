import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

extension TaskFailure<U> on Task<Either<Object, U>> {
  Task<Either<Failure, U>> mapLeftToFailure() => map(
        (either) => either.leftMap(
          (obj) {
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
          },
        ),
      );
}

extension TaskPipeline<U> on Task<U> {
  Future<Either<Failure, U>> runAll() => attempt().mapLeftToFailure().run();
}
