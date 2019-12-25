// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_list_status_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitListStatusState extends Equatable {
  const HabitListStatusState(this._type);

  factory HabitListStatusState.habitListStatusLoading() =
      HabitListStatusLoading;

  factory HabitListStatusState.habitListStatusInitial() =
      HabitListStatusInitial;

  factory HabitListStatusState.habitListStatusSuccess() =
      HabitListStatusSuccess;

  factory HabitListStatusState.habitListStatusFailure(
      {@required String message}) = HabitListStatusFailure;

  final _HabitListStatusState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(HabitListStatusLoading) habitListStatusLoading,
      @required R Function(HabitListStatusInitial) habitListStatusInitial,
      @required R Function(HabitListStatusSuccess) habitListStatusSuccess,
      @required R Function(HabitListStatusFailure) habitListStatusFailure}) {
    switch (this._type) {
      case _HabitListStatusState.HabitListStatusLoading:
        return habitListStatusLoading(this as HabitListStatusLoading);
      case _HabitListStatusState.HabitListStatusInitial:
        return habitListStatusInitial(this as HabitListStatusInitial);
      case _HabitListStatusState.HabitListStatusSuccess:
        return habitListStatusSuccess(this as HabitListStatusSuccess);
      case _HabitListStatusState.HabitListStatusFailure:
        return habitListStatusFailure(this as HabitListStatusFailure);
    }
  }

  @override
  List get props => null;
}

@immutable
class HabitListStatusLoading extends HabitListStatusState {
  const HabitListStatusLoading._()
      : super(_HabitListStatusState.HabitListStatusLoading);

  factory HabitListStatusLoading() {
    _instance ??= HabitListStatusLoading._();
    return _instance;
  }

  static HabitListStatusLoading _instance;
}

@immutable
class HabitListStatusInitial extends HabitListStatusState {
  const HabitListStatusInitial._()
      : super(_HabitListStatusState.HabitListStatusInitial);

  factory HabitListStatusInitial() {
    _instance ??= HabitListStatusInitial._();
    return _instance;
  }

  static HabitListStatusInitial _instance;
}

@immutable
class HabitListStatusSuccess extends HabitListStatusState {
  const HabitListStatusSuccess._()
      : super(_HabitListStatusState.HabitListStatusSuccess);

  factory HabitListStatusSuccess() {
    _instance ??= HabitListStatusSuccess._();
    return _instance;
  }

  static HabitListStatusSuccess _instance;
}

@immutable
class HabitListStatusFailure extends HabitListStatusState {
  const HabitListStatusFailure({@required this.message})
      : super(_HabitListStatusState.HabitListStatusFailure);

  final String message;

  @override
  String toString() => 'HabitListStatusFailure(message:${this.message})';
  @override
  List get props => [message];
}
