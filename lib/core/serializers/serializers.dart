import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_entity.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/app/data/models/sign_up_user.dart';
import 'package:bitplus/app/data/models/social_user.dart';
import 'package:bitplus/app/data/models/social_user_stat.dart';
import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/app/data/models/summary_stat.dart';
import 'package:bitplus/app/data/models/user.dart';
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
  SignUpUser,
  CreationHabit,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
