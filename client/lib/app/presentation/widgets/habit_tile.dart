import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HabitTile extends StatefulWidget {
  final HabitApi habit;

  const HabitTile({
    @required this.habit,
  });

  @override
  _HabitTileState createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  double startPress = 0;
  double currentPress = 0;
  bool isMoving = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            currentPress = details.localPosition.dx;
          });
        },
        onHorizontalDragStart: (details) {
          setState(() {
            startPress = details.localPosition.dx;
            currentPress = details.localPosition.dx;
            isMoving = true;
          });
        },
        onHorizontalDragEnd: (_) {
          setState(() {
            isMoving = false;
          });
        },
        child: Transform.translate(
          offset: Offset(
            isMoving ? currentPress - startPress : 0,
            0,
          ),
          child: Transform.scale(
            scale: isMoving ? 1.05 : 1,
            child: Card(
              color: widget.habit.checked ? Color(widget.habit.color) : null,
              margin: const EdgeInsets.only(
                bottom: 6.0,
                top: 6.0,
              ),
              elevation: isMoving ? 36.0 : 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                child: ListTile(
                  title: Text('${widget.habit.name}'),
                  subtitle: Text('${widget.habit.habitID}'),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Router.updateHabitScreen,
                        arguments: widget.habit,
                      );
                    },
                    icon: Icon(Icons.update),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      if (widget.habit.checked) {
                        BlocProvider.of<HabitListBloc>(context).add(
                          HabitListEvent.habitListUncheck(
                            habitID: widget.habit.habitID,
                          ),
                        );
                      } else {
                        BlocProvider.of<HabitListBloc>(context).add(
                          HabitListEvent.habitListCheck(
                            habitID: widget.habit.habitID,
                          ),
                        );
                      }
                    },
                    child: widget.habit.checked
                        ? CircleAvatar(
                            child: Icon(
                              Icons.check,
                              color: WHITE,
                            ),
                            backgroundColor: Color(widget.habit.color),
                          )
                        : CircleAvatar(
                            child: Icon(
                              Icons.error_outline,
                              color: Color(widget.habit.color),
                            ),
                            backgroundColor: SCAFFOLD_COLOR,
                            foregroundColor: Color(widget.habit.color),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
