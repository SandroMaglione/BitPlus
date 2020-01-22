import 'dart:convert';

import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class LifeAreaRemoteDataSource {
  Future<void> updateAreas(
    String uid,
    BuiltList<int> areas,
  );
}

class LifeAreaRemoteDataSourceImpl implements LifeAreaRemoteDataSource {
  final http.Client client;

  const LifeAreaRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<void> updateAreas(
    String uid,
    BuiltList<int> areas,
  ) async {
    try {
      await http.post(
        'https://us-central1-bitplus-95304.cloudfunctions.net/updateAreas',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "uid": uid,
            "areas": areas.toList(),
          },
        ),
      );

      return true;
    } on http.ClientException {
      throw const FirestoreFailure(
        message: 'Client error while updating areas, try again',
      );
    } on FormatException {
      throw const FirestoreFailure(
        message: 'Format error while updating areas, try again later',
      );
    }
  }
}
