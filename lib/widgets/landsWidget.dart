import 'package:estates_identifier/models/landModel.dart';
import 'package:estates_identifier/screens/updateLand.dart';
import 'package:estates_identifier/viewModels/getViewModels.dart';
import 'package:estates_identifier/viewModels/postViewModels.dart';
import 'package:flutter/material.dart';

class LandsWidget extends StatefulWidget {
  @override
  _LandsWidgetState createState() => _LandsWidgetState();
}

class _LandsWidgetState extends State<LandsWidget> {


  GetViewModels _getViewModels;
  PostViewModel postViewModels;


  List<LandModel> landList;

  @override
  void initState() {
    // TODO: implement initState

    _getViewModels = new GetViewModels();
    postViewModels = new PostViewModel();
     landList = new List<LandModel>();

//    print("getAllLand: ${_getViewModels.getAllLands()}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<List<LandModel>>(
        future: _getViewModels.getAllLands(),
        builder: (context,snapchot){
          if(snapchot.hasData){
            landList = snapchot.data;
            return ListView.builder(
               itemCount: landList.length,
                itemBuilder: (BuildContext context,int index){
                 return GestureDetector(
                   onTap: (){
                     deleteItemAlertDialog(context,landList[index].id);
                   },
                   child: Card(
                     margin: EdgeInsets.all(8.0),
                     elevation: 10,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text("Owner Name: ${landList[index].ownerName}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Owner Phone Number: ${landList[index].phoneNumber}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land Address: ${landList[index].address}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land Area: ${landList[index].area}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land From South: ${landList[index].southSide}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land From North: ${landList[index].northSide}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land From East: ${landList[index].eastSide}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land From West: ${landList[index].westSide}"),
                           SizedBox(
                             height: 3,
                           ),
                           Text("Land Price: ${landList[index].price}.ASD"),
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
          Navigator.of(context).pushNamed( '/updateLand',arguments: UpdateLand(id));
        }
    );
    Widget continueButton = FlatButton(
      child: Text("Delete",style: TextStyle(color: Colors.red),),
      onPressed:  () {
        print('object');
        postViewModels.deleteLand(id);
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
