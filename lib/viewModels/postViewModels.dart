import 'dart:convert' as convert;
import 'package:estates_identifier/models/departmentModel.dart';
import 'package:estates_identifier/models/houseModel.dart';
import 'package:estates_identifier/models/landModel.dart';
import 'package:estates_identifier/models/login.dart';
import 'package:http/http.dart' as http;

class PostViewModel{
  Future<String> addHouse(String ownerName,String phoneNumber,String numOfRooms,String address,String area,String price,
      String westSide,String northSide,String eastSide,String southSide) async{
    var url = "http://192.168.1.9/project-1/addHouse.php";
    var response = await http.post(url,body: {
      "ownerName":ownerName,
      "phoneNumber":phoneNumber,
      "numOfRooms":numOfRooms,
      "address":address,
      "area":area,
      "price":price,
      "westSide":westSide,
      "northSide":northSide,
      "eastSide":eastSide,
      "southSide":southSide,
    });
    String statues = "";
    if(response.statusCode == 200){
     return HouseModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }
  }
  Future<String> deleteLand(String id)async{
    var url = "http://192.168.1.9/project-1/deleteLand.php";
    var response = await http.post(url,body: {
      "id":id,
    });
    String statues = "";
    if(response.statusCode == 200){
      print('success');
      return HouseModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }
  }
  Future<String> deleteDepartment(String id)async{
    var url = "http://192.168.1.9/project-1/deleteDepartment.php";
    var response = await http.post(url,body: {
      "id":id,
    });
    String statues = "";
    if(response.statusCode == 200){
      return HouseModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }
  }  Future<String> deleteHouse(String id)async{
    var url = "http://192.168.1.9/project-1/deleteHouse.php";
    var response = await http.post(url,body: {
      "id":id,
    });
    String statues = "";
    if(response.statusCode == 200){
      return HouseModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }
  }
  Future<List<String>> login(String phoneNumber,String password)async{
    var url = "http://192.168.1.9/project-1/login.php";
    var response = await http.post(url,body: {
      "phoneNumber":phoneNumber,
      "password":password,
    });
    String statues = "";
    if(response.statusCode == 200){
      String statues = Login.fromJson(convert.json.decode(response.body)).success;
      String userName = Login.fromJson(convert.json.decode(response.body)).userName;
      String phoneNumber = Login.fromJson(convert.json.decode(response.body)).phoneNumber;
      List<String> list = new List<String>();
      list.add(statues);
      list.add(userName);
      list.add(phoneNumber);
      return list;
    }else{
      throw Exception("welcome this error");

    }
  }

  Future<String> addDepartment(String ownerName,String phoneNumber,String numOfRooms,String address,String area,String price,
      String westSide,String northSide,String eastSide,String southSide)async{
    var url = "http://192.168.1.9/project-1/addDepartment.php";
    var response = await http.post(url,body: {
      "ownerName":ownerName,
      "phoneNumber":phoneNumber,
      "numOfRooms":numOfRooms,
      "address":address,
      "area":area,
      "price":price,
      "westSide":westSide,
      "northSide":northSide,
      "eastSide":eastSide,
      "southSide":southSide,
    });
    String statues = "";
    if(response.statusCode == 200){
      return DepartmentModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }


  }


  Future<String> addLand(String ownerName,String phoneNumber,String address,String area,String price,
      String westSide,String northSide,String eastSide,String southSide)async{
    var url = "http://192.168.1.9/project-1/addLand.php";
    var response = await http.post(url,body: {
      "ownerName":ownerName,
      "phoneNumber":phoneNumber,
      "address":address,
      "area":area,
      "price":price,
      "westSide":westSide,
      "northSide":northSide,
      "eastSide":eastSide,
      "southSide":southSide,
    });
    String statues = "";
    if(response.statusCode == 200){
      print("object::::::");
      return LandModel.fromJson(convert.json.decode(response.body)).statues;
    }else{
      statues = "please check your connection";
      return statues;
    }


  }


}