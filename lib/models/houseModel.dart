class HouseModel{
  final String id;
  final String statues;
  final String ownerName;
  final String phoneNumber;
  final String numOfRooms;
  final String houseAddress;
  final String houseArea;
  final String housePrice;
  final String westSide;
  final String northSide;
  final String southSide;
  final String eastSide;

  HouseModel(
    this.id,
    this.statues,
      this.ownerName,
      this.phoneNumber,
      this.numOfRooms,
      this.houseAddress,
      this.houseArea,
      this.housePrice,
      this.westSide,
      this.northSide,
      this.southSide,
      this.eastSide);

//
//  factory HouseModel.fromJson(Map<String,dynamic> json){
//
//    return HouseModel(
//
//      ownerName: json['ownerName'],
//      phoneNumber: json['phoneNumber'],
//      numOfRooms: json['numOfRooms'],
//      houseAddress: json['houseAddress'],
//      houseArea: json['houseArea'],
//      housePrice: json['housePrice'],
//      westSide: json['westSide'],
//      northSide: json['northSide'],
//      southSide: json['southSide'],
//      eastSide: json['eastSide'],
//    );
//  }
}