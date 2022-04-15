import 'package:flutter/material.dart';

import 'auth_credentials.dart';

class SignUpPage extends StatefulWidget {
  final ValueChanged<SignUpCredentials> didProvideCredentials;
  final VoidCallback shouldShowLogin;

  SignUpPage({Key? key, 
    required this.didProvideCredentials, 
    required this.shouldShowLogin})
  : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: [
            //Sigunp form
            _singupForm(),
            //Login Button
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),   
                onPressed: widget.shouldShowLogin,
                child: Text('Already have an account? Login.'),             
              ),              
            ),
          ],
        )
      )
    );
  }

  Widget _singupForm(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //username textfield
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Username'
          ),
        ),
        //email textfield
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Email'
          ),
        ),
        //password textfield
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_open),
            labelText: 'Password'            
        ),
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        ),

        //singup button
        ElevatedButton(
          onPressed: _signUp,
          child: Text('Login'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        )
      ],
    );
  }

  void _signUp(){
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final email = _emailController.text.trim();

    print('usuario $username');
    print('password $password');
    print('Email $email');

    final credentials = SignUpCredentials(
      username: username, 
      password: password,
      email: email
    );
    widget.didProvideCredentials(credentials);
  }

}