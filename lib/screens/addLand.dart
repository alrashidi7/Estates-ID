import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AddLand extends StatefulWidget {
  @override
  _AddLandState createState() => _AddLandState();
}

class _AddLandState extends State<AddLand> {
  var _renderObjectKey = new GlobalKey();
  Uint8List memoryImage;
  bool memeory = false;

  Future<Uint8List> _getWidgetImage() async {
    try {
      RenderRepaintBoundary boundary =
          _renderObjectKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print("image: $bs64");
      debugPrint(bs64.length.toString());
      setState(() {
        memoryImage = pngBytes;
        memeory = true;
      });
      return pngBytes;
    } catch (exception) {
      print("exp: $exception");
      return exception;
    }
  }

  final ownerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final area = TextEditingController();
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
        title: Text('Add Land'),
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
                  controller: address,
                  decoration: InputDecoration(
                    hintText: "Input Land Address",
                  )),
              TextField(
                controller: area,
                decoration: InputDecoration(
                  hintText: "Input Land Area",
                ),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Input Land Price",
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
                        price.text.isEmpty) {
                      //a little validation for the textfield
                      showSnackbar("all this data are requird");
                    } else {
                      String data =
                          "Owner Name:${ownerName.text}\nPhoneNumber:${phoneNumber.text}\nAddress:${address.text}\nLand Area:${area.text}\nLand Price:${price.text}.SAR\nWestSide:${westSide.text}\nEastSide:${eastSide.text}\nNorthSide:${northSide.text}\nSouthSide:${southSide.text}";
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
          _getWidgetImage();
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
