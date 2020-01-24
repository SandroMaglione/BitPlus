import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              Navigator.of(context).pushReplacementNamed(
                Router.initLifeAreaScreen,
              );
            } else if (state is Authenticated) {
              Navigator.of(context).pushReplacementNamed(
                Router.homeScreen,
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _buildAuthBloc(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthBloc(BuildContext context, AuthState state) {
    return state.when(
      authUninitialized: (_) => const LoadingIndicator(
        message: 'Loading auth...',
      ),
      authenticated: (_) => const LoadingIndicator(
        message: 'Success auth...',
      ),
      authUnauthenticated: (_) => const LoadingIndicator(
        message: 'Failure auth...',
      ),
    );
  }
}
