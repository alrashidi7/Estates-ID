import 'dart:convert' as convert;
import 'package:estates_identifier/models/departmentModel.dart';
import 'package:estates_identifier/models/houseModel.dart';
import 'package:estates_identifier/models/landModel.dart';
import 'package:http/http.dart' as http;


class GetViewModels {
  Future<List<HouseModel>> getAllHouses() async {
    var url = "http://192.168.1.9/project-1/getAllHouses.php";
    List<HouseModel> houseList = new List<HouseModel>();
    var response = await http.get(url); //

    if(response.statusCode == 200){
      List<dynamic> values = new List<dynamic>();
      values = convert.json.decode(response.body);
      if(values.length > 0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            houseList.add(HouseModel.fromJson(map));
          }
        }
      }
      return houseList;
    }else{
      throw Exception('error');
    }
  }


  Future<List<DepartmentModel>> getAllDepartments() async {
    var url = "http://192.168.1.9/project-1/getAllDepartment.php";
    var response = await http.get(url);
    List<DepartmentModel> departmentList = new List<DepartmentModel>();
    if(response.statusCode == 200){
      List<dynamic> values = new List<dynamic>();
      values = convert.json.decode(response.body);
      if(values.length > 0){
        for(int i=0;i<values.length;i++){
          print("object");
          if(values[i]!= null){
            Map<String,dynamic> map=values[i];
            departmentList.add(DepartmentModel.fromJson(map));
          }
        }
      }

      return departmentList;
    }else{
      throw Exception('error');
    }

  }

  Future<List<LandModel>> getAllLands() async {
    var url = "http://192.168.1.9/project-1/getAllLands.php";
    var response = await http.get(url);
    List<LandModel> landList = new List<LandModel>();
    if (response.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      values = convert.json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            landList.add(LandModel.fromJson(map));
          }
        }
      }
      return landList;
    } else {
      throw Exception('error');
    }
  }

}