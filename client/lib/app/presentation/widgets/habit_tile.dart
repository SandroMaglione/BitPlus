import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
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
      child: Card(
        color: habit.checked ? Color(habit.color) : null,
        margin: const EdgeInsets.only(
          bottom: 2.0,
          top: 2.0,
        ),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: ListTile(
            title: Text('${habit.name}'),
            subtitle: Text('${habit.habitID}'),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Router.updateHabitScreen,
                  arguments: habit,
                );
              },
              icon: Icon(Icons.update),
            ),
            trailing: InkWell(
              onTap: () {
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
              },
              child: !habit.checked
                  ? CircleAvatar(
                      child: Icon(
                        Icons.check,
                        color: WHITE,
                      ),
                      backgroundColor: Color(habit.color),
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.check,
                        color: WHITE,
                      ),
                      backgroundColor: Color(habit.color),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
