import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/app/domain/repositories/summary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSummaryStat implements UseCase<SummaryStat, Params> {
  final SummaryRepository summaryRepository;

  const GetSummaryStat({
    @required this.summaryRepository,
  });

  @override
  Future<Either<Failure, SummaryStat>> call(Params params) {
    return summaryRepository.getSummaryStat(
      params.uid,
      params.startDay,
      params.endDay,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final DateTime startDay;
  final DateTime endDay;

  const Params({
    @required this.uid,
    @required this.startDay,
    @required this.endDay,
  });

  @override
  List<Object> get props => [
        uid,
        startDay,
        endDay,
      ];
}
