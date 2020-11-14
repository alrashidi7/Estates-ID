import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AddDepartment extends StatefulWidget {
  @override
  _AddDepartmentState createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final ownerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final area = TextEditingController();
  final numRooms = TextEditingController();
  final price = TextEditingController();
  final southSide = TextEditingController();
  final westSide = TextEditingController();
  final northSide = TextEditingController();
  final eastSide = TextEditingController();
  final address = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();
  String qrData = "qenerate";
  bool isGenerate = false;

  showSnackbar(String message) {
    globalKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Add Department'),
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
                style: TextStyle(
                    fontSize: 20.0, decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ownerName,
                decoration: InputDecoration(
                  hintText: "Input Owner Name",
                ),
              ),
              TextField(
                controller: phoneNumber,
                decoration: InputDecoration(
                  hintText: "Input Phone Number",
                ),
              ),
              TextField(
                controller: numRooms,
                decoration: InputDecoration(
                  hintText: "Input Number of Rooms",
                ),
              ),
              TextField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: "Input Department Address",
                  )),
              TextField(
                controller: area,
                decoration: InputDecoration(
                  hintText: "Input Department Area",
                ),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Input Department Price",
                ),
              ),
              TextField(
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
                  )),
              TextField(
                  controller: eastSide,
                  decoration: InputDecoration(
                    hintText: "Input East Side",
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {
                    if (ownerName.text.isEmpty ||
                        phoneNumber.text.isEmpty ||
                        area.text.isEmpty ||
                        numRooms.text.isEmpty ||
                        price.text.isEmpty) {
                      //a little validation for the textfield
                      showSnackbar("all this data are requird");
                    } else {
                      String data =
                          "Owner Name:${ownerName.text}\nPhoneNumber:${phoneNumber.text}\nDepartment Area:${area.text}\nNumber of Rooms:${numRooms.text}\nDepartmentPrice:${price.text}.SAR\nAddress:${address.text}\nWestSide:${westSide.text}\nEastSide:${eastSide.text}\nNorthSide:${northSide.text}\nSouthSide:${southSide.text}";
                      setState(() {
                        qrData = data;
                        isGenerate = true;
                      });
                    }
                  },
                  child: Text(
                    "Generate QR_Code",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 3.0),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              isGenerate
                  ? QrImage(data: qrData)
                  : Text(
                      "please add all required fields to can generate QR_Code"),
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
          if (isGenerate == true) {
            showSnackbar("uploading data successfully");
          } else {
            showSnackbar("please generate QR_Code ");
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
