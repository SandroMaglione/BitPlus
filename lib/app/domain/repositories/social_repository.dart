import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SocialRepository {
  Future<Either<Failure, SocialUserStat>> getSocialUserStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  );
}
