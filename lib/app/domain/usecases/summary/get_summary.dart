import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/domain/repositories/summary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSummary implements UseCase<Summary, Params> {
  final SummaryRepository summaryRepository;

  const GetSummary({
    @required this.summaryRepository,
  });

  @override
  Future<Either<Failure, Summary>> call(Params params) {
    return summaryRepository.getSummary(
      params.uid,
      params.date,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final DateTime date;

  const Params({
    @required this.uid,
    @required this.date,
  });

  @override
  List<Object> get props => [
        uid,
        date,
      ];
}
