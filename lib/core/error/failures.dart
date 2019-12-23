import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class JsonSerializationFailure implements Failure {
  final String message;

  const JsonSerializationFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class GettingLocalDataFailure implements Failure {
  final String message;

  const GettingLocalDataFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class FirebaseAuthFailure implements Failure {
  final String message;

  const FirebaseAuthFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class FirestoreFailure implements Failure {
  final String message;

  const FirestoreFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
