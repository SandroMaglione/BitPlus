class JsonConvertFormatException implements Exception {}

class FirestoreException implements Exception {
  final int code;
  const FirestoreException(this.code);
}

class FirebaseAuthException implements Exception {
  final int code;
  const FirebaseAuthException(this.code);
}

class LocalDataException implements Exception {
  final int code;
  const LocalDataException(this.code);
}
