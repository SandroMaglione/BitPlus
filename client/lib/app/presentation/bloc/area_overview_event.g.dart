// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_overview_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AreaOverviewEvent extends Equatable {
  const AreaOverviewEvent(this._type);

  factory AreaOverviewEvent.areaOverviewInitialize(
      {@required BuiltList<dynamic> habitList}) = AreaOverviewInitialize;

  final _AreaOverviewEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AreaOverviewInitialize) areaOverviewInitialize}) {
    switch (this._type) {
      case _AreaOverviewEvent.AreaOverviewInitialize:
        return areaOverviewInitialize(this as AreaOverviewInitialize);
    }
  }

  @override
  List get props => null;
}

@immutable
class AreaOverviewInitialize extends AreaOverviewEvent {
  const AreaOverviewInitialize({@required this.habitList})
      : super(_AreaOverviewEvent.AreaOverviewInitialize);

  final BuiltList<dynamic> habitList;

  @override
  String toString() => 'AreaOverviewInitialize(habitList:${this.habitList})';
  @override
  List get props => [habitList];
}
