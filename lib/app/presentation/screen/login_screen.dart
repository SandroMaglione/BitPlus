import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final List<int> values;
  const LoginScreen(this.values);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoggedUserState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Router.homeScreen,
              (_) => false,
            );
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.when(
              startUpUserState: (_) => LoadingIndicator(
                message: 'Starting...',
              ),
              loadingUserState: (_) => LoadingIndicator(
                message: 'Loading...',
              ),
              loggedUserState: (_) => Text(
                'Success',
              ),
              errorUserState: (state) => Text(
                '${state.message}',
              ),
              emptyUserState: (state) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextInputField(
                      label: 'Email',
                      controller: _emailController,
                    ),
                    TextInputField(
                      label: 'Password',
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    Text('${state.status}'),
                    RaisedButton.icon(
                      onPressed: _signUp,
                      icon: Icon(Icons.sentiment_satisfied),
                      label: Text('SIGN UP'),
                    ),
                    RaisedButton.icon(
                      onPressed: _signIn,
                      icon: Icon(Icons.settings_ethernet),
                      label: Text('SIGN IN'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _signIn() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    BlocProvider.of<UserBloc>(context).add(
      SignInUserEvent(
        email: email,
        password: password,
      ),
    );
  }

  void _signUp() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    BlocProvider.of<UserBloc>(context).add(
      SignUpUserEvent(
        email: email,
        password: password,
        areas: widget.values,
      ),
    );
  }
}
