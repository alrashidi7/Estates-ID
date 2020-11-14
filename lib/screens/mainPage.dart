import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {


  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}


class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), (){
      Navigator.of(context).pushReplacementNamed('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        widthFactor: size.width*0.5,
        heightFactor: size.height*0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius:   BorderRadius.all(Radius.circular(20)),

                child: Image.asset("assets/images/house.png",width: 100,height: 100,color: Theme.of(context).primaryColor,)),
            SizedBox(
              height: 10,
            ),
            Text("Estates ID",style:TextStyle(color:Colors.black,fontSize:30.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
          ],
        ),
      ),

    );
  }
}
