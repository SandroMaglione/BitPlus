import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/presentation/views/history_calendar_grid_view.dart';
import 'package:bitplus/app/presentation/views/history_habit_list_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class HistoryMapScreen extends StatefulWidget {
  final List<int> history;
  final List<HistoryHabit> habitHistory;
  final String name;
  final int color;
  final int areaIndex;

  HistoryMapScreen({
    @required this.history,
    @required this.name,
    @required this.areaIndex,
    @required this.color,
    @required this.habitHistory,
  }) {
    habitHistory.sort(
      (h1, h2) => h2.historyCheck.day.compareTo(
        h1.historyCheck.day,
      ),
    );
  }

  @override
  _HistoryMapScreenState createState() => _HistoryMapScreenState();
}

class _HistoryMapScreenState extends State<HistoryMapScreen> {
  int _bottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.name,
          subtitle: 'Last ${widget.history.length} days',
        ),
        body: _bottomNavigationIndex == 0
            ? HistoryCalendarGridView(
                color: widget.color,
                history: widget.history,
              )
            : HistoryHabitListView(
                areaIndex: widget.areaIndex,
                habitHistory: widget.habitHistory,
              ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: _bottomNavigationIndex,
          onTap: (index) => setState(() => _bottomNavigationIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              title: Text('Calendar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_list,
              ),
              title: Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}
