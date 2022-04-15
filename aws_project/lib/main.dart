import 'package:aws_project/auth_service.dart';
import 'package:aws_project/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:aws_project/login_page.dart';
import 'package:aws_project/sing_up_page.dart';

void main() {
  runApp(MyApp());
}

// 1
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();  
}

class _MyAppState extends State<MyApp> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authService.showLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery App',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      // 2
      home: StreamBuilder<AuthState>(
        stream: _authService.authStateController.stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Navigator(
              pages: [
                //show login page
                if(snapshot.data!.authFlowStatus == AuthFlowStatus.login)
                  MaterialPage(
                    child: LoginPage(
                      didProvideCredentials: _authService.loginWithCredentials,
                      shouldShowSignUp: _authService.showSingUp,                      
                    )
                  ),
                //show verification code page
                if(snapshot.data!.authFlowStatus == AuthFlowStatus.verification)
                  MaterialPage(
                    child: VerificationPage(
                      didProvideVerificationCode: _authService.verifyCode,
                    )
                  ),
                //show sign up page
                if(snapshot.data!.authFlowStatus == AuthFlowStatus.singUp)
                  MaterialPage(
                    child: SignUpPage(
                      didProvideCredentials: _authService.singUpWithCredentials,
                      shouldShowLogin: _authService.showLogin,
                    )
                  ), 

              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          }else{
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        }
        
      ),
    );
  }
}