import 'package:bitplus/app/data/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tUser = User(
    (u) => u
      ..userID = "4XFmgdq8JKX9z1jLquFt8jMZ3hH2"
      ..experience = 0
      ..level = 1,
  );

  group('fromJson', () {
    test('should convert JSON to valid User', () async {
      final result = User.fromJson(
        fixture('user.json'),
      );
      expect(result, equals(tUser));
    });
  });
}
