import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/presentation/widgets/history_habit_tile.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:bitplus/core/extensions/date_time_extension.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HistoryHabitListView extends StatefulWidget {
  final List<HistoryHabit> habitHistory;
  final int areaIndex;

  const HistoryHabitListView({
    Key key,
    @required this.habitHistory,
    @required this.areaIndex,
  }) : super(key: key);

  @override
  _HistoryHabitListViewState createState() => _HistoryHabitListViewState();
}

class _HistoryHabitListViewState extends State<HistoryHabitListView> {
  List<List<HistoryHabit>> sublist;

  @override
  void initState() {
    final List<List<HistoryHabit>> buildSubList = [];
    int currentIndex = 0;

    for (int i = 0; i < widget.habitHistory.length - 1; ++i) {
      if (buildSubList.length < currentIndex + 1) {
        buildSubList.add([]);
      }

      buildSubList[currentIndex].add(widget.habitHistory[i]);

      if (!widget.habitHistory[i].historyCheck.day.isSameDay(
        widget.habitHistory[i + 1].historyCheck.day,
      )) {
        currentIndex += 1;
      }
    }

    setState(() {
      sublist = buildSubList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: index != 0 ? 24.0 : 0,
            bottom: 4.0,
          ),
          child: StickyHeader(
            header: Container(
              width: double.infinity,
              color: SCAFFOLD_COLOR,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Text(
                  '${DateFormat('EEEE - d MMM y').format(sublist[index].first.historyCheck.day)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ACCENT_COLOR_DARK.withOpacity(0.84),
                  ),
                ),
              ),
            ),
            content: Column(
              children: sublist[index]
                  .map(
                    (h) => HistoryHabitTile(
                      historyHabit: h,
                      areaIndex: widget.areaIndex,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      itemCount: sublist.length,
    );
  }
}
