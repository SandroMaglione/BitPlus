import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/core/database/collections.dart';
import 'package:bitplus/core/error/exceptions.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HabitRemoteDataSource {
  /// Returns a [BuiltList] of [Habit] retrieved from the database,
  /// based on the user id provided
  Future<BuiltList<Habit>> getHabitList(String uid);

  /// Creates an [Habit] and uploads it to the database
  ///
  /// It returns the [Habit] with the new habitID assigned
  Future<Habit> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> lifeAreaIds,
  );

  Future<Habit> updateHabit(String uid, String habitID, String name,
      bool isPositive, int value, BuiltList<int> lifeArea);
  Future<void> checkHabit(String uid, String habitID, DateTime date);
  Future<void> uncheckHabit(String uid, String habitID, DateTime date);
  Future<HabitStat> getHabitStat(
      String uid, String habitID, DateTime startDay, DateTime endDay);
}

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  final Firestore firestore;
  final Crashlytics crashlytics;

  const HabitRemoteDataSourceImpl({
    @required this.firestore,
    @required this.crashlytics,
  });

  @override
  Future<void> checkHabit(String uid, String habitID, DateTime date) {
    // TODO: implement checkHabit
    return null;
  }

  @override
  Future<Habit> createHabit(String uid, String name, bool isPositive, int value,
      BuiltList<int> lifeAreaIds) async {
    try {
      final habit = Habit(
        (h) => h
          ..name = name
          ..isPositive = isPositive
          ..color = 0xFF343A40
          ..habitID = 'null'
          ..value = value
          ..lifeAreas = ListBuilder<int>(
            lifeAreaIds,
          ),
      );

      final habitMap = habit.toJsonMap();
      final doc = await firestore
          .collection(USER_COLLECTION)
          .document(uid)
          .collection(HABIT_COLLECTION)
          .add(habitMap);

      final returnHabit = habit.rebuild(
        (h) => h..habitID = doc.documentID,
      );
      return returnHabit;
    } catch (e, s) {
      crashlytics.recordError(e, s);
      throw FirestoreException(400);
    }
  }

  @override
  Future<HabitStat> getHabitStat(
      String uid, String habitID, DateTime startDay, DateTime endDay) {
    // TODO: implement getHabitStat
    return null;
  }

  @override
  Future<void> uncheckHabit(String uid, String habitID, DateTime date) {
    // TODO: implement uncheckHabit
    return null;
  }

  @override
  Future<Habit> updateHabit(String uid, String habitID, String name,
      bool isPositive, int value, BuiltList<int> lifeArea) {
    // TODO: implement updateHabit
    return null;
  }

  @override
  Future<BuiltList<Habit>> getHabitList(String uid) async {
    try {
      final allDocs = await firestore
          .collection(USER_COLLECTION)
          .document(uid)
          .collection(HABIT_COLLECTION)
          .getDocuments();

      // TODO: Add also the habit id to the map from Firestore
      final habitList = allDocs.documents.map(
        (snapshot) => Habit.fromJson(
          snapshot.data,
        ),
      );
      final builtList = BuiltList<Habit>(habitList);
      return builtList;
    } catch (e, s) {
      crashlytics.recordError(e, s);
      throw FirestoreException(401);
    }
  }
}
