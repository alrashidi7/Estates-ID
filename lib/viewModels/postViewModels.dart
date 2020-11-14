import 'dart:convert' as convert;
import 'package:estates_identifier/models/departmentModel.dart';
import 'package:estates_identifier/models/houseModel.dart';
import 'package:estates_identifier/models/landModel.dart';
import 'package:http/http.dart' as http;

class PostViewModel{
//  Future<String> addHouse(String ownerName,String phoneNumber,String numOfRooms,String address,String area,String price,
//      String westSide,String northSide,String eastSide,String southSide ) async{
//    var url = "";
//    var response = await http.post(url,body: {
//      "ownerName":ownerName,
//      "phoneNumber":phoneNumber,
//      "numOfRooms":numOfRooms,
//      "address":address,
//      "area":area,
//      "price":price,
//      "westSide":westSide,
//      "northSide":northSide,
//      "eastSide":eastSide,
//      "southSide":southSide,
//    });
//    String statues = "";
//    if(response.statusCode == 200){
//     return HouseModel.fromJson(convert.json.decode(response.body)).statues;
//    }else{
//      statues = "please check your connection";
//      return statues;
//    }
//  }



//  Future<String> addDepartment(String ownerName,String phoneNumber,String numOfRooms,String address,String area,String price,
//      String westSide,String northSide,String eastSide,String southSide )async{
//    var url = "";
//    var response = await http.post(url,body: {
//      "ownerName":ownerName,
//      "phoneNumber":phoneNumber,
//      "numOfRooms":numOfRooms,
//      "address":address,
//      "area":area,
//      "price":price,
//      "westSide":westSide,
//      "northSide":northSide,
//      "eastSide":eastSide,
//      "southSide":southSide,
//    });
//    String statues = "";
//    if(response.statusCode == 200){
//      return DepartmentModel.fromJson(convert.json.decode(response.body)).statues;
//    }else{
//      statues = "please check your connection";
//      return statues;
//    }
//
//
//  }

//
//  Future<String> addLand(String ownerName,String phoneNumber,String address,String area,String price,
//      String westSide,String northSide,String eastSide,String southSide )async{
//    var url = "";
//    var response = await http.post(url,body: {
//      "ownerName":ownerName,
//      "phoneNumber":phoneNumber,
//      "address":address,
//      "area":area,
//      "price":price,
//      "westSide":westSide,
//      "northSide":northSide,
//      "eastSide":eastSide,
//      "southSide":southSide,
//    });
//    String statues = "";
//    if(response.statusCode == 200){
//      return LandModel.fromJson(convert.json.decode(response.body)).statues;
//    }else{
//      statues = "please check your connection";
//      return statues;
//    }
//
//
//  }
//

}