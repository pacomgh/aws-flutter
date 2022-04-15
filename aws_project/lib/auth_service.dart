import 'dart:async';

import 'package:aws_project/auth_credentials.dart';
//este enum contiene las paginas que queremos manejar enumeradas
enum AuthFlowStatus {login, singUp, verification, session}

//constructor de la clase
class AuthState{//objeto que se oberva
  final AuthFlowStatus authFlowStatus; 

  AuthState({required this.authFlowStatus});
}

//administra el controlador de stream u maneja logica de login
class AuthService{
  final authStateController = StreamController<AuthState>();

  //manejamos el momento en que se va a mandar mostrar la pagina singup
  void showSingUp(){
    final state = AuthState(authFlowStatus: AuthFlowStatus.singUp);
    authStateController.add(state);
  }

  void showLogin(){
    final state = AuthState(authFlowStatus: AuthFlowStatus.login);
    authStateController.add(state);
  }

  void loginWithCredentials(AuthCredentials credentials){
    final state = AuthState(authFlowStatus: AuthFlowStatus.session);
    authStateController.add(state);
  }

  void singUpWithCredentials(AuthCredentials credentials){
    final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
    authStateController.add(state);
  }

  //maneja el copdigo de verificacion y actualiza el estado de sesion
  void verifyCode(String verificationCode){
    final state = AuthState(authFlowStatus: AuthFlowStatus.session);
    authStateController.add(state);
  }

}