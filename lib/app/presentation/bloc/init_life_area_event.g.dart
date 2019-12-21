// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_life_area_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class InitLifeAreaEvent extends Equatable {
  const InitLifeAreaEvent(this._type);

  factory InitLifeAreaEvent.addPointInitLifeAreaEvent(
      {@required int lifeAreaID}) = AddPointInitLifeAreaEvent;

  factory InitLifeAreaEvent.removePointInitLifeAreaEvent(
      {@required int lifeAreaID}) = RemovePointInitLifeAreaEvent;

  final _InitLifeAreaEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(AddPointInitLifeAreaEvent) addPointInitLifeAreaEvent,
      @required
          R Function(RemovePointInitLifeAreaEvent)
              removePointInitLifeAreaEvent}) {
    switch (this._type) {
      case _InitLifeAreaEvent.AddPointInitLifeAreaEvent:
        return addPointInitLifeAreaEvent(this as AddPointInitLifeAreaEvent);
      case _InitLifeAreaEvent.RemovePointInitLifeAreaEvent:
        return removePointInitLifeAreaEvent(
            this as RemovePointInitLifeAreaEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class AddPointInitLifeAreaEvent extends InitLifeAreaEvent {
  const AddPointInitLifeAreaEvent({@required this.lifeAreaID})
      : super(_InitLifeAreaEvent.AddPointInitLifeAreaEvent);

  final int lifeAreaID;

  @override
  String toString() =>
      'AddPointInitLifeAreaEvent(lifeAreaID:${this.lifeAreaID})';
  @override
  List get props => [lifeAreaID];
}

@immutable
class RemovePointInitLifeAreaEvent extends InitLifeAreaEvent {
  const RemovePointInitLifeAreaEvent({@required this.lifeAreaID})
      : super(_InitLifeAreaEvent.RemovePointInitLifeAreaEvent);

  final int lifeAreaID;

  @override
  String toString() =>
      'RemovePointInitLifeAreaEvent(lifeAreaID:${this.lifeAreaID})';
  @override
  List get props => [lifeAreaID];
}
