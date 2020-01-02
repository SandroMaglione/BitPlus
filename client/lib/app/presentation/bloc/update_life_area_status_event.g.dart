// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_life_area_status_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class UpdateLifeAreaStatusEvent extends Equatable {
  const UpdateLifeAreaStatusEvent(this._type);

  factory UpdateLifeAreaStatusEvent.updateLifeAreaStatusPostUpdate(
      {@required BuiltList<dynamic> areas}) = UpdateLifeAreaStatusPostUpdate;

  final _UpdateLifeAreaStatusEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(UpdateLifeAreaStatusPostUpdate)
              updateLifeAreaStatusPostUpdate}) {
    switch (this._type) {
      case _UpdateLifeAreaStatusEvent.UpdateLifeAreaStatusPostUpdate:
        return updateLifeAreaStatusPostUpdate(
            this as UpdateLifeAreaStatusPostUpdate);
    }
  }

  @override
  List get props => null;
}

@immutable
class UpdateLifeAreaStatusPostUpdate extends UpdateLifeAreaStatusEvent {
  const UpdateLifeAreaStatusPostUpdate({@required this.areas})
      : super(_UpdateLifeAreaStatusEvent.UpdateLifeAreaStatusPostUpdate);

  final BuiltList<dynamic> areas;

  @override
  String toString() => 'UpdateLifeAreaStatusPostUpdate(areas:${this.areas})';
  @override
  List get props => [areas];
}
