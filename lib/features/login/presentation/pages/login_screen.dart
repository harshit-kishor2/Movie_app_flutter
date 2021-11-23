import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shared_component/custom_button.dart';
import 'package:movie_app/core/shared_component/custom_text.dart';
import 'package:movie_app/core/shared_component/custom_toast.dart';
import 'package:movie_app/core/shared_component/widget_helper.dart';
import 'package:movie_app/features/login/presentation/bloc/bloc.dart';
import 'package:movie_app/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Local states
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool changeButton = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _tooglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              _handleState(context, state);
            },
            builder: (context, state) {
              return Center(
                child: _handleBuilder(context, state),
              );
            },
          ),
        ),
      ),
    );
  }

// Handle Listener
  void _handleState(context, state) {
    if (state is Loaded) {
      toast("Login Successfully");
      navigationPushReplacementsss(context, Routes.MOVIES);
    } else if (state is Error) {
      setState(() {});
      changeButton = false;
      toast("Error:${state.message}");
    } else if (state is Loading) {
      toast("Loading");
    }
  }

  //Handle builder
  Container _handleBuilder(context, state) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            getLable(
              msg: "Login",
              fontSize: 25,
            ),
            getDivider(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      String t = v ?? '';
                      return t.trim().isNotEmpty ? null : "Enter Email";
                    },
                    decoration: textFieldStyle(
                        labelTextStr: "Username",
                        hintTextStr: "Enter Username"),
                  ),
                  getSizeBox(height: 15),
                  TextFormField(
                    controller: _passController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      String t = v ?? '';
                      return t.trim().length > 5 ? null : "Enter Password";
                    },
                    decoration: textFieldStyle(
                      labelTextStr: "Password",
                      hintTextStr: "Enter Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: _tooglePassword,
                      ),
                    ),
                  ),
                  getSizeBox(height: 15),
                  getAnimatedButton(
                    changeButton,
                    'Login',
                    onButtonClick,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onButtonClick() {
    if ((_formKey.currentState as FormState).validate()) {
      changeButton = true;
      setState(() {});
      context
          .read<LoginBloc>()
          .add(LoginButtonPressed(_emailController.text, _passController.text));
    }
  }
}
