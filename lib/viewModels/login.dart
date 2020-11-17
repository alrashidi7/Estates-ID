import 'package:estates_identifier/screens/homePage.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel{
  void goHome(BuildContext context,String userName,String phoneNumber){
    Navigator.of(context).pushNamed('/home',arguments: HomePage(userName, phoneNumber));
  }
}