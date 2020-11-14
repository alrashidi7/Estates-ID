//import 'dart:convert' as convert;
import 'package:estates_identifier/models/departmentModel.dart';
import 'package:estates_identifier/models/houseModel.dart';
import 'package:estates_identifier/models/landModel.dart';
import 'package:http/http.dart' as http;


class GetViewModels{
  Future<List<HouseModel>> getAllHouses() async{
    var url = "";
    List<HouseModel> houseList = new List<HouseModel>();
    var response = await http.get(url);//
//    if(response.statusCode == 200){
//      List<dynamic> values = new List<dynamic>();
//      values = convert.json.decode(response.body);
//      if(values.length > 1){
//        for(int i=0;i<values.length;i++){
//          if(values[i]!=null){
//            Map<String,dynamic> map=values[i];
//            houseList.add(HouseModel.fromJson(map));
//          }
//        }
//      }
//      return houseList;
//    }else{
//      throw Exception('error');
//    }

    HouseModel houseModel = new HouseModel("1","saved","alrashidi","01094034584","2",
        "maadi 9 aloroba street","340","12000","building","nothing","kornish","villa");
    houseList.add(houseModel);
    houseList.add(houseModel);
    houseList.add(houseModel);
    houseList.add(houseModel);

    return houseList;

  }
  Future<List<DepartmentModel>> getAllDepartments()async{
    var url = "";
    var response = await http.post(url);
    List<DepartmentModel> departmentList = new List<DepartmentModel>();
//    if(response.statusCode == 200){
//      List<dynamic> values = new List<dynamic>();
//      values = convert.json.decode(response.body);
//      if(values.length > 1){
//        for(int i=0;i<values.length;i++){
//          if(values[i]!=null){
//            Map<String,dynamic> map=values[i];
//            departmentList.add(DepartmentModel.fromJson(map));
//          }
//        }
//      }
//      return departmentList;
//    }else{
//      throw Exception('error');
//    }

    DepartmentModel departmentModel = new DepartmentModel("1","saved","alrashidi","01094034584","4",
        "maadi 9 aloroba street","340","12000","building","nothing","kornish","villa");

    departmentList.add(departmentModel);
    departmentList.add(departmentModel);
    departmentList.add(departmentModel);
    departmentList.add(departmentModel);

    return departmentList;
  }
  Future<List<LandModel>> getAllLands()async{
    var url = "";
//    var response = await http.post(url);
    List<LandModel> landList = new List<LandModel>();
//    if(response.statusCode == 200){
//      List<dynamic> values = new List<dynamic>();
//      values = convert.json.decode(response.body);
//      if(values.length > 1){
//        for(int i=0;i<values.length;i++){
//          if(values[i]!=null){
//            Map<String,dynamic> map=values[i];
//              landList.add(LandModel.fromJson(map));
//          }
//        }
//      }
//      return landList;
//    }else{
//      throw Exception('error');
//    }

    LandModel landModel = new LandModel("1","saved","alrashidi","01094034584",
        "maadi 9 aloroba street","340","12000","building","nothing","kornish","villa");
    landList.add(landModel);
    landList.add(landModel);
    landList.add(landModel);
    landList.add(landModel);

    print("getAllLand: ${landList.length}");
    return landList;
  }

}