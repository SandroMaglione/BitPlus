import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/app/domain/repositories/social_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSocialUserStat implements UseCase<SocialUserStat, Params> {
  final SocialRepository socialRepository;

  const GetSocialUserStat({
    @required this.socialRepository,
  });

  @override
  Future<Either<Failure, SocialUserStat>> call(Params params) {
    return socialRepository.getSocialUserStat(
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
