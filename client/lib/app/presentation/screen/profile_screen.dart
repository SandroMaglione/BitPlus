import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/core/extensions/string_extension.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          rightIcon: Icons.exit_to_app,
          rightAction: () => _signOut(context),
          title: 'Profile',
          subtitle: 'My settings',
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          LIFE_AREAS[index].name.capitalize,
                        ),
                        // leading: CircleAvatar(
                        //   backgroundColor: WHITE,
                        //   child: Text(
                        //     '${index + 1}°',
                        //     style: TextStyle(
                        //       color: ACCENT_COLOR,
                        //     ),
                        //   ),
                        // ),
                        trailing: CircleAvatar(
                          backgroundColor: SCAFFOLD_COLOR,
                          child: Text(
                            '${(state as Authenticated).user.areas[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ACCENT_COLOR_DARK,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: LIFE_AREAS.length,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Router.updateLifeAreaScreen,
                    arguments: (state as Authenticated).user.areas.toList(),
                  );
                },
                child: Text(
                  'Update area points',
                  style: TextStyle(
                    color: ACCENT_COLOR_DARK,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.authSignOut(),
    );
  }
}
