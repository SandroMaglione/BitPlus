import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
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
        title: Text('Login ${widget.values}'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoggedUserState) {
            Navigator.of(context).pushReplacementNamed(
              Router.homeScreen,
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
              emptyUserState: (state) => Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  Text('${state.status}'),
                  RaisedButton.icon(
                    onPressed: _signUp,
                    icon: Icon(Icons.format_color_reset),
                    label: Text('Sign Up'),
                  ),
                  RaisedButton.icon(
                    onPressed: _signIn,
                    icon: Icon(Icons.local_airport),
                    label: Text('Sign in'),
                  ),
                ],
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
      ),
    );
  }
}
