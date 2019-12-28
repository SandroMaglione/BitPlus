import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/slide_action_tile.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HabitTile extends StatelessWidget {
  final HabitApi habit;

  const HabitTile({
    @required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: SlideActionTile(
        rightContent: CircleAvatar(
          child: Icon(
            habit.checked
                ? Icons.exposure_neg_1
                : Icons.exposure_plus_1,
            color: Color(habit.color),
          ),
          backgroundColor: SCAFFOLD_COLOR,
        ),
        leftContent: CircleAvatar(
          child: Icon(
            Icons.update,
            color: ACCENT_COLOR_DARK,
          ),
          backgroundColor: SCAFFOLD_COLOR,
        ),
        animationDuration: Duration(
          milliseconds: 900,
        ),
        onSlideToRight: () {
          Navigator.of(context).pushNamed(
            Router.updateHabitScreen,
            arguments: habit,
          );
        },
        onSlideToLeft: () => _toggleCheck(context),
        child: Card(
          color: habit.checked ? Color(habit.color) : null,
          margin: const EdgeInsets.only(
            bottom: 6.0,
            top: 6.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            child: ListTile(
              title: Text('${habit.name}'),
              subtitle: Text('${habit.countChecks} times in lasy 30 days'),
              trailing: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Router.historyMapScreen,
                    arguments: HistoryMapScreenArguments(
                      history: habit.history.map((day) => day ? 1 : 0).toList(),
                      name: habit.name,
                      color: habit.color,
                    ),
                  );
                },
                child: CircleAvatar(
                  child: Text(
                    'x${habit.streak}',
                    style: TextStyle(
                      color: Color(habit.color),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  backgroundColor: SCAFFOLD_COLOR,
                  foregroundColor: Color(habit.color),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleCheck(BuildContext context) {
    if (habit.checked) {
      BlocProvider.of<HabitListBloc>(context).add(
        HabitListEvent.habitListUncheck(
          habitID: habit.habitID,
        ),
      );
    } else {
      BlocProvider.of<HabitListBloc>(context).add(
        HabitListEvent.habitListCheck(
          habitID: habit.habitID,
        ),
      );
    }
  }
}
