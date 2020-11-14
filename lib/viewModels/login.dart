import 'package:flutter/cupertino.dart';

class LoginViewModel{
  void sendData(){}
  void goHome(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }
}