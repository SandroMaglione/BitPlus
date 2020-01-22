import 'package:bitplus/app/data/models/init_life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateLifeAreaBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
        builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.arrow_back),
              label: const Text('Back'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              '${BlocProvider.of<InitLifeAreaBloc>(context).state.pointsLeft}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color: ACCENT_COLOR_DARK,
              ),
            ),
            FlatButton(
              onPressed: state.isAreasValid ? () => _update(context) : null,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _update(BuildContext context) {
    final areas = BlocProvider.of<InitLifeAreaBloc>(context).state;

    if (areas.isAreasValid) {
      BlocProvider.of<UpdateLifeAreaStatusBloc>(context).add(
        UpdateLifeAreaStatusEvent.updateLifeAreaStatusPostUpdate(
          areas: areas.values,
        ),
      );
    }
  }
}
