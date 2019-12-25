import 'package:bitplus/app/data/models/social_user_stat.dart';

abstract class SocialRemoteDataSource {
  Future<SocialUserStat> getSocialUserStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  );
}

class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  @override
  Future<SocialUserStat> getSocialUserStat(
    String uid,
    DateTime startDay,
    DateTime endDay,
  ) {
    // TODO: implement getSocialUserStat
    return null;
  }
}
