import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/init_life_area_view.dart';
import 'package:bitplus/app/presentation/views/login_form_view.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/core/enums/login_status_page.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => serviceLocator<LoginBloc>(),
        ),
        BlocProvider<LoginCredentialsBloc>(
          create: (context) => serviceLocator<LoginCredentialsBloc>(),
        ),
        BlocProvider<LoginStatusBloc>(
          create: (context) => serviceLocator<LoginStatusBloc>(),
        ),
        BlocProvider<InitLifeAreaBloc>(
          create: (context) => serviceLocator<InitLifeAreaBloc>(),
        ),
      ],
      child: LoginContent(),
    );
  }
}

class LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signing in'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Router.homeScreen,
              (_) => false,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            return loginState.when(
              loginInProgress: (_) =>
                  BlocBuilder<LoginStatusBloc, LoginStatusPage>(
                builder: (context, loginStatusState) {
                  switch (loginStatusState) {
                    case LoginStatusPage.InitAreasView:
                      return InitLifeAreaView();
                    case LoginStatusPage.FormView:
                      return LoginFormView();
                    default:
                      return Text('We got an error here, eh?');
                  }
                },
              ),
              loginSubmitting: (_) => LoadingIndicator(
                message: 'Signing in',
              ),
              loginSuccess: (_) => Text('Success'),
              loginFailure: (state) => LoadingIndicator(
                message: '${state.message}',
              ),
            );
          },
        ),
      ),
    );
  }
}
