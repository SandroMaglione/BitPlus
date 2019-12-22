import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/app/data/models/init_life_area.dart';

class InitLifeAreaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitLifeAreaBloc>(
          create: (context) => serviceLocator<InitLifeAreaBloc>(),
        )
      ],
      child: InitLifeAreaContent(),
    );
  }
}

class InitLifeAreaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your life areas'),
      ),
      body: BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
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
                            Text('Area ${index + 1}'),
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
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Router.loginScreen,
                  );
                },
                child: Text('Sign in'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            Router.loginScreen,
            arguments: BlocProvider.of<InitLifeAreaBloc>(context)
                .state
                .values
                .toList(),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
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
