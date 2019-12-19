import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryRemoteDataSource {
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
  @override
  Future<Either<Failure, Summary>> createSummary(
      String uid, DateTime date, String text, int dayTag) {
    // TODO: implement createSummary
    return null;
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
