import 'package:estates_identifier/viewModels/getViewModels.dart';
import 'package:estates_identifier/viewModels/postViewModels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AddHouse extends StatefulWidget {
  @override
  _AddHouseState createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {

  final ownerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final area = TextEditingController();
  final price = TextEditingController();
  final numRooms = TextEditingController();
  final southSide = TextEditingController();
  final westSide = TextEditingController();
  final northSide = TextEditingController();
  final eastSide = TextEditingController();
  final address = TextEditingController();
  PostViewModel postViewModel;
  GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();
  String qrData ="qenerate";
  bool isGenerate = false;
  showSnackbar(String message){
    globalKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    // TODO: implement initState
    postViewModel = new PostViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Add House'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "New QR Generator:",
                style: TextStyle(fontSize: 20.0,decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ownerName,
                decoration: InputDecoration(
                  hintText: "Input Owner Name",
                ),
              ),TextField(
                controller: phoneNumber,
                decoration: InputDecoration(
                  hintText: "Input Phone Number",
                ),
              ),TextField(
                controller: numRooms,
                decoration: InputDecoration(
                  hintText: "Input Number of Rooms",
                ),
              ),TextField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: "Input House Address",
                  )),TextField(
                controller: area,
                decoration: InputDecoration(
                  hintText: "Input House Area",
                ),
              ),TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Input House Price",
                ),
              ),TextField(
                controller: westSide,
                decoration: InputDecoration(
                  hintText: "Input West Side",
                ),
              ),
              TextField(
                  controller: northSide,
                  decoration: InputDecoration(
                    hintText: "Input North Side",
                  )),
              TextField(
                  controller: southSide,
                  decoration: InputDecoration(
                    hintText: "Input South Side",
                  )),TextField(
                  controller: eastSide,
                  decoration: InputDecoration(
                    hintText: "Input East Side",
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {

                    if (ownerName.text.isEmpty || phoneNumber.text.isEmpty || area.text.isEmpty || numRooms.text.isEmpty ||price.text.isEmpty) {        //a little validation for the textfield
                      showSnackbar("all this data are requird");
                    } else {
                      String data = "Owner Name:${ownerName.text}\nPhoneNumber:${phoneNumber.text}\nHouse Area:${area.text}\nNumber of Rooms:${numRooms.text}\nHouse Price:${price.text}.SAR\nAddress:${address.text}\nWestSide:${westSide.text}\nEastSide:${eastSide.text}\nNorthSide:${northSide.text}\nSouthSide:${southSide.text}";
                      setState(() {
                        qrData = data;
                        isGenerate = true;
                      });
                    }

                  },
                  child: Text(
                    "Generate QR_Code",
                    style: TextStyle(
                        color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 3.0),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 40,
              ),isGenerate?
              QrImage(data: qrData) :
                  Text("please add all required fields to can generate QR_Code"),
              Container(
                height: 40,
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          if(isGenerate == true){
            postViewModel.addHouse(ownerName.text, phoneNumber.text, numRooms.text, address.text, area.text, price.text, westSide.text, northSide.text, eastSide.text, southSide.text);
            showSnackbar("uploading data successfully");
          }else{
            showSnackbar("please generate QR_Code ");
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

}
