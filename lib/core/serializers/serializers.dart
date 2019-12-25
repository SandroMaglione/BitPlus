import 'package:bitplus/app/data/models/api/create_habit_req.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/api/post_user_account.dart';
import 'package:bitplus/app/data/models/api/update_habit_req.dart';
import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_entity.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/app/data/models/init_login_form.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/app/data/models/login_status_info.dart';
import 'package:bitplus/app/data/models/social_user.dart';
import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/enums/login_status_page.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

/// Collection of generated serializers
@SerializersFor([
  User,
  Habit,
  HabitEntity,
  HabitStat,
  Summary,
  SummaryStat,
  LifeArea,
  LifeAreaStat,
  SocialUser,
  SocialUserStat,
  CreationHabit,
  HabitApi,
  PostUserAccount,
  CreateHabitReq,
  UpdateHabitReq,
  LoginStatusInfo,
  LoginStatusPage,
  InitLoginForm,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
