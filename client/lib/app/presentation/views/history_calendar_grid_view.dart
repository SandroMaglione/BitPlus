import 'package:bitplus/app/presentation/bloc/area_overview_bloc.dart';
import 'package:bitplus/app/presentation/widgets/history_calendar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCalendarGridView extends StatelessWidget {
  final List<int> history;
  final int color;
  final int areaIndex;

  const HistoryCalendarGridView({
    Key key,
    @required this.history,
    @required this.color,
    @required this.areaIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        final DateTime day = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );

        return HistoryCalendarTile(
          countNegative: BlocProvider.of<AreaOverviewBloc>(context)
              .getCountNegativeInDay(areaIndex, day),
          countPositive: BlocProvider.of<AreaOverviewBloc>(context)
              .getCountPositiveInDay(areaIndex, day),
          date: day,
        );
      },
      itemCount: history.length,
    );
  }
}
