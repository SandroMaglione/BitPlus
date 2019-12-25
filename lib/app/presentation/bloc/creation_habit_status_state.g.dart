// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_habit_status_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CreationHabitStatusState extends Equatable {
  const CreationHabitStatusState(this._type);

  factory CreationHabitStatusState.creationHabitStatusLoading() =
      CreationHabitStatusLoading;

  factory CreationHabitStatusState.creationHabitStatusInProgress() =
      CreationHabitStatusInProgress;

  factory CreationHabitStatusState.creationHabitStatusSuccess() =
      CreationHabitStatusSuccess;

  factory CreationHabitStatusState.creationHabitStatusFailure(
      {@required String message}) = CreationHabitStatusFailure;

  final _CreationHabitStatusState _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(CreationHabitStatusLoading) creationHabitStatusLoading,
      @required
          R Function(CreationHabitStatusInProgress)
              creationHabitStatusInProgress,
      @required
          R Function(CreationHabitStatusSuccess) creationHabitStatusSuccess,
      @required
          R Function(CreationHabitStatusFailure) creationHabitStatusFailure}) {
    switch (this._type) {
      case _CreationHabitStatusState.CreationHabitStatusLoading:
        return creationHabitStatusLoading(this as CreationHabitStatusLoading);
      case _CreationHabitStatusState.CreationHabitStatusInProgress:
        return creationHabitStatusInProgress(
            this as CreationHabitStatusInProgress);
      case _CreationHabitStatusState.CreationHabitStatusSuccess:
        return creationHabitStatusSuccess(this as CreationHabitStatusSuccess);
      case _CreationHabitStatusState.CreationHabitStatusFailure:
        return creationHabitStatusFailure(this as CreationHabitStatusFailure);
    }
  }

  @override
  List get props => null;
}

@immutable
class CreationHabitStatusLoading extends CreationHabitStatusState {
  const CreationHabitStatusLoading._()
      : super(_CreationHabitStatusState.CreationHabitStatusLoading);

  factory CreationHabitStatusLoading() {
    _instance ??= CreationHabitStatusLoading._();
    return _instance;
  }

  static CreationHabitStatusLoading _instance;
}

@immutable
class CreationHabitStatusInProgress extends CreationHabitStatusState {
  const CreationHabitStatusInProgress._()
      : super(_CreationHabitStatusState.CreationHabitStatusInProgress);

  factory CreationHabitStatusInProgress() {
    _instance ??= CreationHabitStatusInProgress._();
    return _instance;
  }

  static CreationHabitStatusInProgress _instance;
}

@immutable
class CreationHabitStatusSuccess extends CreationHabitStatusState {
  const CreationHabitStatusSuccess._()
      : super(_CreationHabitStatusState.CreationHabitStatusSuccess);

  factory CreationHabitStatusSuccess() {
    _instance ??= CreationHabitStatusSuccess._();
    return _instance;
  }

  static CreationHabitStatusSuccess _instance;
}

@immutable
class CreationHabitStatusFailure extends CreationHabitStatusState {
  const CreationHabitStatusFailure({@required this.message})
      : super(_CreationHabitStatusState.CreationHabitStatusFailure);

  final String message;

  @override
  String toString() => 'CreationHabitStatusFailure(message:${this.message})';
  @override
  List get props => [message];
}
