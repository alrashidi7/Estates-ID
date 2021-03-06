import 'package:estates_identifier/viewModels/login.dart';
import 'package:estates_identifier/viewModels/postViewModels.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool rememberMe = false;
  bool isloading = false;
  bool isSuccess = false;
  LoginViewModel viewModel;
  PostViewModel postViewModel ;

  @override
  void initState() {
    // TODO: implement initState
     viewModel = new LoginViewModel();
     postViewModel = new PostViewModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 350,
                    height: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/login.gif'),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Welcome back..',textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phoneController,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:Theme.of(context).primaryColor),
                      focusColor: Theme.of(context).primaryColor,
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:Theme.of(context).primaryColor ),
                      focusColor: Theme.of(context).backgroundColor,
                      prefixIcon: Icon(Icons.lock_open),
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).primaryColor ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          isloading = true;
                        });
                        // ignore: unrelated_type_equality_checks
                        postViewModel.login(phoneController.text, passwordController.text).then((List result){
                          print("result:${result[0]}");
                          setState(() {
                            isloading = false;
                          });
                          if(result[0] == "success"){

                            viewModel.goHome(context,result[1],result[2]);
                          }else{

                          }
                        });



                     //   sendData();
                      },
                      elevation: 10,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('You don`t have Account?! ',
                          style: TextStyle(color: Colors.black87)),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('/register');
                          },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],

              ),
            ),
          ),
          Center(
            child:  isloading ? SizedBox(
              width: 100,
              height: 100,
              child: Card(
                elevation: 8,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ) : SizedBox(),
          ),
          Center(
            child:  isSuccess ? SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Card(
                  elevation: 8,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/suit.png',width: 100.0,height: 100.0,),
                        Text('\nwelcome back',style: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),),
                        //TODO
                        Text('showGetLoginName',style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ) : SizedBox(),
          ),
        ],
      ),
    );
  }
}
