import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SocialRemoteDataSource {
  Future<Either<Failure, SocialUserStat>> getSocialUserStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  );
}

class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  @override
  Future<Either<Failure, SocialUserStat>> getSocialUserStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  ) {
    // TODO: implement getSocialUserStat
    return null;
  }
}
