import 'package:bitplus/core/database/collections.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class SummaryRemoteDataSource {
  /// Creates a [Summary] and uploads it to the database
  ///
  /// It returns the [Summary] built and uploaded
  Future<Summary> createSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  );

  Future<Summary> updateSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  );
  Future<Summary> getSummary(String uid, DateTime date);
  Future<SummaryStat> getSummaryStat(
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
  Future<Summary> createSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  ) async {
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

    return summary;
  }

  @override
  Future<Summary> getSummary(String uid, DateTime date) {
    // TODO: implement getSummary
    return null;
  }

  @override
  Future<SummaryStat> getSummaryStat(
      String uid, DateTime startDay, DateTime endDay) {
    // TODO: implement getSummaryStat
    return null;
  }

  @override
  Future<Summary> updateSummary(
      String uid, DateTime date, String text, int dayTag) {
    // TODO: implement updateSummary
    return null;
  }
}
