import 'package:estates_identifier/models/departmentModel.dart';
import 'package:estates_identifier/screens/updateDepartment.dart';
import 'package:estates_identifier/viewModels/getViewModels.dart';
import 'package:estates_identifier/viewModels/postViewModels.dart';
import 'package:flutter/material.dart';

class DepartmentWidget extends StatefulWidget {
  @override
  _DepartmentWidgetState createState() => _DepartmentWidgetState();
}

class _DepartmentWidgetState extends State<DepartmentWidget> {


  GetViewModels _getViewModels;
  PostViewModel postViewModel;


  List<DepartmentModel> departmentList;

  @override
  void initState() {
    _getViewModels = new GetViewModels();
    postViewModel = new PostViewModel();
    departmentList = new List<DepartmentModel>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<List<DepartmentModel>>(
        future: _getViewModels.getAllDepartments(),
        builder: (context,snapchot){
          if(snapchot.hasData){
            departmentList = snapchot.data;
            return ListView.builder(
                itemCount: departmentList.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){
                      deleteItemAlertDialog(context, departmentList[index].id);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Owner Name: ${departmentList[index].ownerName}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Owner Phone Number: ${departmentList[index].phoneNumber}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department Address: ${departmentList[index].address}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department Area: ${departmentList[index].area}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department Rooms: ${departmentList[index].numOfRooms}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department From South: ${departmentList[index].southSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department From North: ${departmentList[index].northSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department From East: ${departmentList[index].eastSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department From West: ${departmentList[index].westSide}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Department Price: ${departmentList[index].price}.ASD"),
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
        Navigator.of(context).pushNamed( '/updateDepartment',arguments: UpdateDepartment(id));
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Delete",style: TextStyle(color: Colors.red),),
      onPressed:  () {
        print('object');
        postViewModel.deleteDepartment(id);
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
