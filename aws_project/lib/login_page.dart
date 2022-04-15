import 'package:flutter/material.dart';

import 'auth_credentials.dart';

class LoginPage extends StatefulWidget {

  final ValueChanged<LoginCredentials> didProvideCredentials;


  final VoidCallback shouldShowSignUp;
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({Key? key, 
    required this.didProvideCredentials,
    required this.shouldShowSignUp}) 
  :super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

  
}

class _LoginPageState extends State<LoginPage> {
  @override
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children:[
            //login form
            _loginForm(),
            //sing up button
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: widget.shouldShowSignUp,
                child: Text('Don\'t have an account? Sign up.'),
                //onPressed: () {
                //  Navigator.pushNamed(context, '/singup');
                //},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //username textfield
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.mail),
            labelText: 'Username',
          ),
        ),
        //password textfield
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_open),
            labelText: 'Password',
          ),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),

        //login button
        ElevatedButton(
          onPressed: _login,
          child: Text('Login'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        )
      ],
    );
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('usuario $username');
    print('password $password');

    final credentials = LoginCredentials(username: username, password: password);
    widget.didProvideCredentials(credentials);
  }
}
