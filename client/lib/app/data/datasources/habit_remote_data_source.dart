import 'dart:convert';

import 'package:bitplus/app/data/models/api/create_habit_req.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/api/update_habit_req.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/theme/habit_color.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

abstract class HabitRemoteDataSource {
  /// Returns a [BuiltList] of [HabitApi] retrieved from the database,
  /// based on the user id provided
  Future<BuiltList<HabitApi>> getHabitList(
    String uid,
    int dateRange,
  );

  /// Creates an [CreateHabitReq] and updates it into the database
  ///
  /// It returns the updated [HabitApi]
  Future<HabitApi> updateHabit(
    String uid,
    String habitID,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
    bool checked,
  );

  /// Creates an [CreateHabitReq] and uploads it to the database
  ///
  /// It returns the new [HabitApi] with the new habitID assigned
  Future<HabitApi> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
  );

  /// Checks and habit, making the attribute `checked` true
  Future<void> checkHabit(String uid, String habitID);

  /// Unchecks and habit, making the attribute `checked` false
  Future<void> uncheckHabit(String uid, String habitID);
}

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  final http.Client client;
  final Firestore firestore;

  const HabitRemoteDataSourceImpl({
    @required this.firestore,
    @required this.client,
  });

  @override
  Future<BuiltList<HabitApi>> getHabitList(
    String uid,
    int dateRange,
  ) async {
    try {
      final resp = await http.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/getTodayHabitList',
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "uid": uid,
          "dateRange": dateRange
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
    } on FormatException {
      throw FirestoreFailure(
        message: 'Format error while fetching habit list, try again later',
      );
    }
  }

  @override
  Future<void> checkHabit(
    String uid,
    String habitID,
  ) async {
    final resp = await http.post(
      'https://us-central1-bitplus-95304.cloudfunctions.net/checkDailyHabit',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          "userID": uid,
          "habitID": habitID,
        },
      ),
    );

    if (resp.statusCode == 200) {
      return true;
    } else {
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
    final resp = await http.post(
      'https://us-central1-bitplus-95304.cloudfunctions.net/uncheckDailyHabit',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          "userID": uid,
          "habitID": habitID,
        },
      ),
    );

    if (resp.statusCode == 200) {
      return true;
    } else if (resp.statusCode == 500) {
      throw FirestoreFailure(
        message: 'Error: could not handle the request, try again',
      );
    } else {
      throw FirestoreFailure(
        message: 'Client error while fetching habit list, try again',
      );
    }
  }

  @override
  Future<HabitApi> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
  ) async {
    final color = getHabitColor().value;

    final habitReq = CreateHabitReq(
      (h) => h
        ..uid = uid
        ..color = color
        ..name = name
        ..isPositive = isPositive
        ..value = value
        ..areas = areas.toBuilder(),
    );

    return await _manageHabit(
      'https://us-central1-bitplus-95304.cloudfunctions.net/createHabit',
      habitReq.toJson(),
      (habitID) => HabitApi(
        (h) => h
          ..habitID = habitID
          ..checked = false
          ..color = color
          ..name = name
          ..isPositive = isPositive
          ..value = value
          ..areas = areas.toBuilder(),
      ),
    );
  }

  @override
  Future<HabitApi> updateHabit(
    String uid,
    String habitID,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
    bool checked,
  ) async {
    final color = getHabitColor().value;

    final habitReq = UpdateHabitReq(
      (h) => h
        ..uid = uid
        ..habitID = habitID
        ..color = color
        ..name = name
        ..isPositive = isPositive
        ..value = value
        ..areas = areas.toBuilder(),
    );

    return await _manageHabit(
      'https://us-central1-bitplus-95304.cloudfunctions.net/updateHabit',
      habitReq.toJson(),
      (habitID) => HabitApi(
        (h) => h
          ..habitID = habitID
          ..checked = checked
          ..color = color
          ..name = name
          ..isPositive = isPositive
          ..value = value
          ..areas = areas.toBuilder(),
      ),
    );
  }

  Future<HabitApi> _manageHabit(
    String url,
    String jsonBody,
    HabitApi Function(String habitID) getHabit,
  ) async {
    try {
      final resp = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      if (resp.statusCode != 200) {
        throw FirestoreFailure(
          message: 'Client error while fetching habit list, try again',
        );
      } else {
        return getHabit(resp.body);
      }
    } on http.ClientException {
      throw FirestoreFailure(
        message: 'Client error while fetching habit list, try again',
      );
    } on JsonUnsupportedObjectError {
      throw JsonSerializationFailure(
        message: 'Error while converting data, try again later',
      );
    }
  }
}