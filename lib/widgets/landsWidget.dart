
import 'package:estates_identifier/models/landModel.dart';
import 'package:estates_identifier/viewModels/getViewModels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandsWidget extends StatefulWidget {
  @override
  _LandsWidgetState createState() => _LandsWidgetState();
}

class _LandsWidgetState extends State<LandsWidget> {


  GetViewModels _getViewModels;


  List<LandModel> landList;

  @override
  void initState() {
    // TODO: implement initState

    _getViewModels = new GetViewModels();


     landList = new List<LandModel>();

    print("getAllLand: ${_getViewModels.getAllLands()}");
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
                 return Card(
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
                         Text("Land Address: ${landList[index].houseAddress}"),
                         SizedBox(
                           height: 3,
                         ),
                         Text("Land Area: ${landList[index].houseArea}"),
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
                         Text("Land Price: ${landList[index].housePrice}.ASD"),
                       ],
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
}
