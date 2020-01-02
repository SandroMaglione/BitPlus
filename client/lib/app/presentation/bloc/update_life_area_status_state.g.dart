// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_life_area_status_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class UpdateLifeAreaStatusState extends Equatable {
  const UpdateLifeAreaStatusState(this._type);

  factory UpdateLifeAreaStatusState.updateLifeAreaStatusLoading() =
      UpdateLifeAreaStatusLoading;

  factory UpdateLifeAreaStatusState.updateLifeAreaStatusInitial() =
      UpdateLifeAreaStatusInitial;

  factory UpdateLifeAreaStatusState.updateLifeAreaStatusSuccess() =
      UpdateLifeAreaStatusSuccess;

  factory UpdateLifeAreaStatusState.updateLifeAreaStatusFailure(
      {@required String message}) = UpdateLifeAreaStatusFailure;

  final _UpdateLifeAreaStatusState _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(UpdateLifeAreaStatusLoading) updateLifeAreaStatusLoading,
      @required
          R Function(UpdateLifeAreaStatusInitial) updateLifeAreaStatusInitial,
      @required
          R Function(UpdateLifeAreaStatusSuccess) updateLifeAreaStatusSuccess,
      @required
          R Function(UpdateLifeAreaStatusFailure)
              updateLifeAreaStatusFailure}) {
    switch (this._type) {
      case _UpdateLifeAreaStatusState.UpdateLifeAreaStatusLoading:
        return updateLifeAreaStatusLoading(this as UpdateLifeAreaStatusLoading);
      case _UpdateLifeAreaStatusState.UpdateLifeAreaStatusInitial:
        return updateLifeAreaStatusInitial(this as UpdateLifeAreaStatusInitial);
      case _UpdateLifeAreaStatusState.UpdateLifeAreaStatusSuccess:
        return updateLifeAreaStatusSuccess(this as UpdateLifeAreaStatusSuccess);
      case _UpdateLifeAreaStatusState.UpdateLifeAreaStatusFailure:
        return updateLifeAreaStatusFailure(this as UpdateLifeAreaStatusFailure);
    }
  }

  @override
  List get props => null;
}

@immutable
class UpdateLifeAreaStatusLoading extends UpdateLifeAreaStatusState {
  const UpdateLifeAreaStatusLoading._()
      : super(_UpdateLifeAreaStatusState.UpdateLifeAreaStatusLoading);

  factory UpdateLifeAreaStatusLoading() {
    _instance ??= UpdateLifeAreaStatusLoading._();
    return _instance;
  }

  static UpdateLifeAreaStatusLoading _instance;
}

@immutable
class UpdateLifeAreaStatusInitial extends UpdateLifeAreaStatusState {
  const UpdateLifeAreaStatusInitial._()
      : super(_UpdateLifeAreaStatusState.UpdateLifeAreaStatusInitial);

  factory UpdateLifeAreaStatusInitial() {
    _instance ??= UpdateLifeAreaStatusInitial._();
    return _instance;
  }

  static UpdateLifeAreaStatusInitial _instance;
}

@immutable
class UpdateLifeAreaStatusSuccess extends UpdateLifeAreaStatusState {
  const UpdateLifeAreaStatusSuccess._()
      : super(_UpdateLifeAreaStatusState.UpdateLifeAreaStatusSuccess);

  factory UpdateLifeAreaStatusSuccess() {
    _instance ??= UpdateLifeAreaStatusSuccess._();
    return _instance;
  }

  static UpdateLifeAreaStatusSuccess _instance;
}

@immutable
class UpdateLifeAreaStatusFailure extends UpdateLifeAreaStatusState {
  const UpdateLifeAreaStatusFailure({@required this.message})
      : super(_UpdateLifeAreaStatusState.UpdateLifeAreaStatusFailure);

  final String message;

  @override
  String toString() => 'UpdateLifeAreaStatusFailure(message:${this.message})';
  @override
  List get props => [message];
}
