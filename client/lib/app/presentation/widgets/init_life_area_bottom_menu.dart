import 'package:bitplus/app/data/models/init_life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitLifeAreaBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
        builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: state.isAreasValid
                  ? () {
                      Navigator.of(context).pushNamed(
                        Router.loginFormScreen,
                        arguments: BlocProvider.of<InitLifeAreaBloc>(context)
                            .state
                            .values
                            .toList(),
                      );
                    }
                  : null,
              child: const Text('Sign up'),
            ),
            Text(
              '${state.pointsLeft}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color:
                    state.pointsLeft > 0 ? ACCENT_COLOR_DARK : NEGATIVE_COLOR,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Router.loginFormScreen,
                );
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
