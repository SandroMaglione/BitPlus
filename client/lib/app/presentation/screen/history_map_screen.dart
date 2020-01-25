import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/views/history_calendar_grid_view.dart';
import 'package:bitplus/app/presentation/views/history_habit_list_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class HistoryMapScreen extends StatefulWidget {
  final LifeArea area;

  HistoryMapScreen({
    @required this.area,
  }) {
    area.historyHabit.toList().sort(
          (h1, h2) => h2.historyDayCheck.day.compareTo(
            h1.historyDayCheck.day,
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
          title: widget.area.name,
          subtitle: 'Last ${widget.area.history.length} days',
        ),
        body: _bottomNavigationIndex == 0
            ? HistoryCalendarGridView(
                color: widget.area.color,
                areaIndex: widget.area.areaID,
                history: widget.area.history.toList(),
              )
            : HistoryHabitListView(
                areaIndex: widget.area.areaID,
                habitHistory: widget.area.historyHabit.toList(),
              ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: _bottomNavigationIndex,
          onTap: (index) => setState(() => _bottomNavigationIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              title: const Text('Calendar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_list,
              ),
              title: const Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}
