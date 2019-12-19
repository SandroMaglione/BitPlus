import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call_missed_outgoing,
            ),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is EmptyUserState) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Router.loginScreen,
                  (_) => false,
                );
              }
            },
          ),
        ],
        child: Placeholder(),
      ),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      SignOutUserEvent(),
    );
  }
}
