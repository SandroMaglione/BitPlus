import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
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
        horizontal: 30.0,
      ),
      child: Card(
        color: habit.checked ? Color(habit.color).withOpacity(0.12) : null,
        margin: const EdgeInsets.only(bottom: 24.0, top: 12.0),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Color(habit.color).withOpacity(0.56),
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          child: ListTile(
            title: Text('${habit.name}'),
            subtitle: Text('${habit.habitID}'),
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
              child: CircleAvatar(
                backgroundColor: Color(habit.color),
                child: Icon(
                  habit.checked ? Icons.check : Icons.cached,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
