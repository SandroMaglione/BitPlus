// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitState extends Equatable {
  const HabitState(this._type);

  factory HabitState.initialHabitState() = InitialHabitState;

  factory HabitState.loadingHabitState() = LoadingHabitState;

  factory HabitState.emptyHabitState() = EmptyHabitState;

  factory HabitState.errorHabitState({@required String message}) =
      ErrorHabitState;

  factory HabitState.loadedHabitState({@required BuiltList<dynamic> habits}) =
      LoadedHabitState;

  final _HabitState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(InitialHabitState) initialHabitState,
      @required R Function(LoadingHabitState) loadingHabitState,
      @required R Function(EmptyHabitState) emptyHabitState,
      @required R Function(ErrorHabitState) errorHabitState,
      @required R Function(LoadedHabitState) loadedHabitState}) {
    switch (this._type) {
      case _HabitState.InitialHabitState:
        return initialHabitState(this as InitialHabitState);
      case _HabitState.LoadingHabitState:
        return loadingHabitState(this as LoadingHabitState);
      case _HabitState.EmptyHabitState:
        return emptyHabitState(this as EmptyHabitState);
      case _HabitState.ErrorHabitState:
        return errorHabitState(this as ErrorHabitState);
      case _HabitState.LoadedHabitState:
        return loadedHabitState(this as LoadedHabitState);
    }
  }

  @override
  List get props => null;
}

@immutable
class InitialHabitState extends HabitState {
  const InitialHabitState._() : super(_HabitState.InitialHabitState);

  factory InitialHabitState() {
    _instance ??= InitialHabitState._();
    return _instance;
  }

  static InitialHabitState _instance;
}

@immutable
class LoadingHabitState extends HabitState {
  const LoadingHabitState._() : super(_HabitState.LoadingHabitState);

  factory LoadingHabitState() {
    _instance ??= LoadingHabitState._();
    return _instance;
  }

  static LoadingHabitState _instance;
}

@immutable
class EmptyHabitState extends HabitState {
  const EmptyHabitState._() : super(_HabitState.EmptyHabitState);

  factory EmptyHabitState() {
    _instance ??= EmptyHabitState._();
    return _instance;
  }

  static EmptyHabitState _instance;
}

@immutable
class ErrorHabitState extends HabitState {
  const ErrorHabitState({@required this.message})
      : super(_HabitState.ErrorHabitState);

  final String message;

  @override
  String toString() => 'ErrorHabitState(message:${this.message})';
  @override
  List get props => [message];
}

@immutable
class LoadedHabitState extends HabitState {
  const LoadedHabitState({@required this.habits})
      : super(_HabitState.LoadedHabitState);

  final BuiltList<dynamic> habits;

  @override
  String toString() => 'LoadedHabitState(habits:${this.habits})';
  @override
  List get props => [habits];
}
