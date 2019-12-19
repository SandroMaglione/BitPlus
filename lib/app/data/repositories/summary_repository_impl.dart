import 'package:meta/meta.dart';
import 'package:bitplus/app/data/datasources/summary_remote_data_source.dart';
import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/app/domain/repositories/summary_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final SummaryRemoteDataSource summaryRemoteDataSource;

  const SummaryRepositoryImpl({
    @required this.summaryRemoteDataSource,
  });

  @override
  Future<Either<Failure, Summary>> createSummary(
    String uid,
    DateTime date,
    String text,
    int dayTag,
  ) async {
    final summary = summaryRemoteDataSource.createSummary(
      uid,
      date,
      text,
      dayTag,
    );
    return summary;
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
