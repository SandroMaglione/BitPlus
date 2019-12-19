import 'package:bitplus/core/database/collections.dart';
import 'package:bitplus/core/error/error_messages.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class SummaryRemoteDataSource {
  /// Creates a [Summary] and uploads it to the database
  ///
  /// It returns the [Summary] built and uploaded
  Future<Either<Failure, Summary>> createSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  );

  Future<Either<Failure, Summary>> updateSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  );
  Future<Either<Failure, Summary>> getSummary(String uid, DateTime date);
  Future<Either<Failure, SummaryStat>> getSummaryStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  );
}

class SummaryRemoteDataSourceImpl implements SummaryRemoteDataSource {
  final Firestore firestore;
  final Crashlytics crashlytics;

  const SummaryRemoteDataSourceImpl({
    @required this.firestore,
    @required this.crashlytics,
  });

  @override
  Future<Either<Failure, Summary>> createSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  ) async {
    try {
      final summary = Summary(
        (s) => s
          ..text = text
          ..date = date
          ..dayTag = dayTag,
      );

      final summaryMap = summary.toJsonMap();
      await firestore
          .collection(USER_COLLECTION)
          .document(uid)
          .collection(SUMMARY_COLLECTION)
          .add(summaryMap);

      return Right(summary);
    } catch (e, s) {
      crashlytics.recordError(e, s);
      return Left(
        FirestoreFailure(
          message: ERROR_CREATE_SUMMARY,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Summary>> getSummary(String uid, DateTime date) {
    // TODO: implement getSummary
    return null;
  }

  @override
  Future<Either<Failure, SummaryStat>> getSummaryStat(
      String uid, DateTime startDay, DateTime endDay) {
    // TODO: implement getSummaryStat
    return null;
  }

  @override
  Future<Either<Failure, Summary>> updateSummary(
      String uid, DateTime date, String text, int dayTag) {
    // TODO: implement updateSummary
    return null;
  }
}
