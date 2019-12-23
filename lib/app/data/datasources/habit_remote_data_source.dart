import 'dart:convert';

import 'package:bitplus/app/data/models/api/create_habit_api.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/core/database/collections.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

abstract class HabitRemoteDataSource {
  /// Returns a [BuiltList] of [HabitApi] retrieved from the database,
  /// based on the user id provided
  Future<BuiltList<HabitApi>> getHabitList(String uid);

  /// Creates an [CreateHabitApi] and uploads it to the database
  ///
  /// It returns the new [HabitApi] with the new habitID assigned
  Future<HabitApi> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> lifeAreaIds,
  );

  /// Checks and habit, making the attribute `checked` true
  Future<void> checkHabit(String uid, String habitID);

  /// Unchecks and habit, making the attribute `checked` false
  Future<void> uncheckHabit(String uid, String habitID);
}

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  final Crashlytics crashlytics;
  final http.Client client;
  final Firestore firestore;

  const HabitRemoteDataSourceImpl({
    @required this.firestore,
    @required this.client,
    @required this.crashlytics,
  });

  @override
  Future<HabitApi> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> lifeAreaIds,
  ) async {
    try {
      final habit = CreateHabitApi(
        (h) => h
          ..color = RandomColor()
              .randomColor(
                colorSaturation: ColorSaturation.highSaturation,
              )
              .value
          ..name = name
          ..isPositive = isPositive
          ..value = value
          ..dateCreated = DateTime.now().toUtc()
          ..areas = ListBuilder<int>(
            lifeAreaIds,
          ),
      );

      final habitMap = json.decode(
        habit.toJson(),
      );

      final doc = await firestore
          .collection(USER_COLLECTION)
          .document(uid)
          .collection(HABIT_COLLECTION)
          .add(habitMap);

      final returnHabit = HabitApi(
        (h) => h
          ..habitID = doc.documentID
          ..color = RandomColor()
              .randomColor(
                colorSaturation: ColorSaturation.highSaturation,
              )
              .value
          ..checked = false
          ..name = name
          ..isPositive = isPositive
          ..value = value
          ..areas = ListBuilder<int>(
            lifeAreaIds,
          ),
      );
      return returnHabit;
    } on JsonUnsupportedObjectError {
      throw JsonSerializationFailure(
        message: 'Error while converting data, try again later',
      );
    }
  }

  @override
  Future<BuiltList<HabitApi>> getHabitList(String uid) async {
    try {
      final resp = await http.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/getTodayHabitList',
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "userID": uid,
        }),
      );
      final habitList = json.decode(resp.body);
      return BuiltList<HabitApi>(
        habitList.map(
          (habit) => HabitApi.fromJson(
            json.encode(habit),
          ),
        ),
      );
    } on http.ClientException {
      throw FirestoreFailure(
        message: 'Client error while fetching habit list, try again',
      );
    }
  }

  @override
  Future<void> checkHabit(
    String uid,
    String habitID,
  ) async {
    try {
      final resp = await http.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/checkDailyHabit',
        headers: {'Content-Type': 'application/json'},
        body: {
          "userID": uid,
          "habitID": habitID,
        },
      );

      if (resp.statusCode == 200) {
        return true;
      } else {
        throw FirestoreFailure(
          message: 'Client error while fetching habit list, try again',
        );
      }
    } catch (e) {
      throw FirestoreFailure(
        message: 'Client error while fetching habit list, try again',
      );
    }
  }

  @override
  Future<void> uncheckHabit(
    String uid,
    String habitID,
  ) async {
    try {
      final resp = await http.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/uncheckDailyHabit',
        headers: {'Content-Type': 'application/json'},
        body: {
          "userID": uid,
          "habitID": habitID,
        },
      );

      if (resp.statusCode == 200) {
        return true;
      } else {
        throw FirestoreFailure(
          message: 'Client error while fetching habit list, try again',
        );
      }
    } catch (e) {
      throw FirestoreFailure(
        message: 'Client error while fetching habit list, try again',
      );
    }
  }
}
