import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryRepository {
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
  Future<Either<Failure, Summary>> getSummary(
    String uid,
    DateTime date,
  );
  Future<Either<Failure, SummaryStat>> getSummaryStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  );
}
