import 'package:estates_identifier/models/houseModel.dart';
import 'package:estates_identifier/screens/updateHouse.dart';
import 'package:estates_identifier/viewModels/getViewModels.dart';
import 'package:estates_identifier/viewModels/postViewModels.dart';
import 'package:flutter/material.dart';

class HouseWidget extends StatefulWidget {
  @override
  _HouseWidgetState createState() => _HouseWidgetState();
}

class _HouseWidgetState extends State<HouseWidget> {


  GetViewModels _getViewModels;
  PostViewModel postViewModel;


  List<HouseModel> houseList;

  @override
  void initState() {
    _getViewModels = new GetViewModels();
    postViewModel = new PostViewModel();
    houseList = new List<HouseModel>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<List<HouseModel>>(
        future: _getViewModels.getAllHouses(),
        builder: (context,snapchot){
          if(snapchot.hasData){
            houseList = snapchot.data;
            return ListView.builder(
                itemCount: houseList.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){
                      deleteItemAlertDialog(context, houseList[index].id);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Owner Name: ${houseList[index].ownerName}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Owner Phone Number: ${houseList[index].phoneNumber}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House Address: ${houseList[index].address}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House Area: ${houseList[index].area}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House Rooms: ${houseList[index].numOfRooms}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House From South: ${houseList[index].southSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House From North: ${houseList[index].northSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House From East: ${houseList[index].eastSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House From West: ${houseList[index].westSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("House Price: ${houseList[index].price}.ASD"),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  deleteItemAlertDialog(BuildContext context,String id) {

    // set up the buttons
    Widget cancelButton = FlatButton(
        child: Text("Update"),
        onPressed:  () {
          Navigator.of(context).pushNamed( '/updateHouse',arguments: UpdateHouse(id));
        }
    );
    Widget continueButton = FlatButton(
      child: Text("Delete",style: TextStyle(color: Colors.red),),
      onPressed:  () {
        print('object');
        postViewModel.deleteHouse(id);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete/Update this Item"),
      content: Text("Would you like to delete or update this item?!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
