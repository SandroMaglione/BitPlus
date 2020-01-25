import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/slide_action_tile.dart';
import 'package:bitplus/app/presentation/widgets/streak_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/extensions/color_extension.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;

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
          backgroundColor: SCAFFOLD_COLOR,
          child: Icon(
            habit.checked ? Icons.exposure_neg_1 : Icons.exposure_plus_1,
            color: Color(habit.color),
          ),
        ),
        leftContent: CircleAvatar(
          backgroundColor: SCAFFOLD_COLOR,
          child: Icon(
            Icons.update,
            color: ACCENT_COLOR_DARK,
          ),
        ),
        animationDuration: const Duration(
          milliseconds: 900,
        ),
        onSlideToRight: () {
          Navigator.of(context).pushNamed(
            Router.creationHabitScreen,
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
              title: Text(
                '${habit.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(habit.color).makeTextLight && habit.checked
                      ? WHITE
                      : ACCENT_COLOR_DARK,
                ),
              ),
              subtitle: Text(
                '${habit.countChecks} times in last ${habit.history.length} days',
                style: TextStyle(
                  color: Color(habit.color).makeTextLight && habit.checked
                      ? WHITE.withOpacity(0.84)
                      : ACCENT_COLOR_DARK.withOpacity(0.54),
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  // TODO: Show calendar with habit check history onTap
                },
                child: StreakIndicator(
                  color: habit.color,
                  streak: habit.streak,
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
