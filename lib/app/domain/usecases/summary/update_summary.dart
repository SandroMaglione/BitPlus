import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/domain/repositories/summary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateSummary implements UseCase<Summary, Params> {
  final SummaryRepository summaryRepository;

  const UpdateSummary({
    @required this.summaryRepository,
  });

  @override
  Future<Either<Failure, Summary>> call(Params params) {
    return summaryRepository.updateSummary(
      params.uid,
      params.date,
      params.text,
      params.dayTag,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final DateTime date;
  final String text;
  final int dayTag;

  const Params({
    @required this.uid,
    @required this.date,
    @required this.text,
    @required this.dayTag,
  });

  @override
  List<Object> get props => [
        uid,
        date,
        text,
        dayTag,
      ];
}
