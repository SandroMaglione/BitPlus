import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/app/data/models/init_life_area.dart';

class InitLifeAreaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Text('${state.pointsLeft} points left'),
            Expanded(
              // TODO: Sort life areas based on most important area (more points)
              child: ListView.builder(
                itemCount: state.values.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('${LIFE_AREAS[index].name}'),
                          Text('${state.values[index]}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => _addPoint(context, index),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _removePoint(context, index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            OutlineButton(
              onPressed:
                  BlocProvider.of<InitLifeAreaBloc>(context).state.isAreasValid
                      ? () {
                          BlocProvider.of<LoginStatusBloc>(context).add(
                            LoginStatusEvent.loginStatusMoveToFormView(),
                          );
                        }
                      : null,
              child: Text('Complete'),
            ),
            OutlineButton(
              onPressed: () {
                BlocProvider.of<LoginStatusBloc>(context).add(
                  LoginStatusEvent.loginStatusMoveToFormView(),
                );
              },
              child: Text('Sign in directly'),
            ),
          ],
        );
      },
    );
  }

  void _addPoint(BuildContext context, int index) {
    BlocProvider.of<InitLifeAreaBloc>(context).add(
      AddPointInitLifeAreaEvent(
        lifeAreaID: index,
      ),
    );
  }

  void _removePoint(BuildContext context, int index) {
    BlocProvider.of<InitLifeAreaBloc>(context).add(
      RemovePointInitLifeAreaEvent(
        lifeAreaID: index,
      ),
    );
  }
}
