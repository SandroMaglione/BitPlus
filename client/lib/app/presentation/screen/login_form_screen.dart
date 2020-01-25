import 'package:bitplus/app/data/models/init_login_form.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/injection_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormScreen extends StatelessWidget {
  final List<int> areas;

  const LoginFormScreen(this.areas);

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
      ],
      child: LoginFormView(areas),
    );
  }
}

class LoginFormView extends StatefulWidget {
  final List<int> areas;

  const LoginFormView(this.areas);

  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Router.homeScreen,
            (_) => false,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, loginState) {
              return loginState.when(
                loginInProgress: (_) => _displayLoginForm(false, ''),
                loginFailure: (state) => _displayLoginForm(true, state.message),
                loginSuccess: (_) => const Text('Success'),
                loginSubmitting: (_) => const LoadingIndicator(
                  message: 'Signing in',
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _displayLoginForm(bool hasError, String errorMessage) {
    return BlocBuilder<LoginCredentialsBloc, InitLoginForm>(
      builder: (context, loginCredentialsState) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextInputField(
              label: 'Email',
              controller: _emailController,
              onChanged: (value) {
                BlocProvider.of<LoginCredentialsBloc>(context).add(
                  LoginCredentialsEvent.loginCredentialsChangeEmail(
                    email: value,
                  ),
                );
              },
            ),
            TextInputField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
              onChanged: (value) {
                BlocProvider.of<LoginCredentialsBloc>(context).add(
                  LoginCredentialsEvent.loginCredentialsChangePassword(
                    password: value,
                  ),
                );
              },
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: NEGATIVE_COLOR,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (isAreasValid)
              RaisedButton.icon(
                onPressed: loginCredentialsState.isFormValid
                    ? _signUpCredentials
                    : null,
                icon: Icon(Icons.sentiment_satisfied),
                label: Text('SIGN UP EMAIL'),
              ),
            if (isAreasValid)
              RaisedButton.icon(
                onPressed: _signUpGoogle,
                icon: Icon(Icons.golf_course),
                label: Text('SIGN UP GOOGLE'),
              ),
            RaisedButton.icon(
              onPressed:
                  loginCredentialsState.isFormValid ? _signInCredentials : null,
              icon: Icon(Icons.signal_cellular_4_bar),
              label: Text('SIGN IN EMAIL'),
            ),
            RaisedButton.icon(
              onPressed: _signInGoogle,
              icon: Icon(Icons.usb),
              label: Text('SIGN IN GOOGLE'),
            ),
          ],
        ),
      ),
    );
  }

  void _signInGoogle() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginSignInGoogle(),
    );
  }

  void _signUpGoogle() {
    final BuiltList<int> areas = initAreas;

    BlocProvider.of<LoginBloc>(context).add(
      LoginSignUpGoogle(
        areas: areas,
      ),
    );
  }

  void _signInCredentials() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    BlocProvider.of<LoginBloc>(context).add(
      LoginSignInCredentials(
        email: email,
        password: password,
      ),
    );
  }

  void _signUpCredentials() {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final BuiltList<int> areas = initAreas;

    BlocProvider.of<LoginBloc>(context).add(
      LoginSignUpCredentials(
        email: email,
        password: password,
        areas: areas,
      ),
    );
  }

  BuiltList<int> get initAreas => BuiltList<int>(widget.areas);
  bool get isAreasValid => widget.areas != null;
}
