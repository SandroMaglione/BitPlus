import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/app/domain/repositories/social_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<Either<Failure, SocialUserStat>> getSocialUserStat(
      String uid, DateTime startDay, DateTime endDay) {
    // TODO: implement getSocialUserStat
    return null;
  }
}
