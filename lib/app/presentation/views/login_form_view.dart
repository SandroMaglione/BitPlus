import 'package:bitplus/app/data/models/init_life_area.dart';
import 'package:bitplus/app/data/models/init_login_form.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormView extends StatefulWidget {
  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
      builder: (context, initLifeAreaState) =>
          BlocBuilder<LoginCredentialsBloc, InitLoginForm>(
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
              if (initLifeAreaState.isAreasValid)
                RaisedButton.icon(
                  onPressed: loginCredentialsState.isFormValid
                      ? _signUpCredentials
                      : null,
                  icon: Icon(Icons.sentiment_satisfied),
                  label: Text('SIGN UP EMAIL'),
                ),
              if (initLifeAreaState.isAreasValid)
                RaisedButton.icon(
                  onPressed: _signUpGoogle,
                  icon: Icon(Icons.golf_course),
                  label: Text('SIGN UP GOOGLE'),
                ),
              RaisedButton.icon(
                onPressed: loginCredentialsState.isFormValid
                    ? _signInCredentials
                    : null,
                icon: Icon(Icons.signal_cellular_4_bar),
                label: Text('SIGN IN EMAIL'),
              ),
              RaisedButton.icon(
                onPressed: _signInGoogle,
                icon: Icon(Icons.usb),
                label: Text('SIGN IN GOOGLE'),
              ),
              RaisedButton.icon(
                onPressed: () {
                  BlocProvider.of<LoginStatusBloc>(context).add(
                    LoginStatusEvent.loginStatusMoveToAreasView(),
                  );
                },
                icon: Icon(Icons.repeat_one),
                label: Text('Back to areas'),
              ),
            ],
          ),
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
    final BuiltList<int> areas = getInitAreas();

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
    final BuiltList<int> areas = getInitAreas();

    BlocProvider.of<LoginBloc>(context).add(
      LoginSignUpCredentials(
        email: email,
        password: password,
        areas: areas,
      ),
    );
  }

  BuiltList<int> getInitAreas() =>
      BlocProvider.of<InitLifeAreaBloc>(context).state.values;
}
