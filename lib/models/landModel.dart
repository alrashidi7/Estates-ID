class LandModel{
  final String id;
  final String statues;
  final String ownerName;
  final String phoneNumber;
  final String houseAddress;
  final String houseArea;
  final String housePrice;
  final String westSide;
  final String northSide;
  final String southSide;
  final String eastSide;

  LandModel(
    this.id,
    this.statues,
    this.ownerName,
    this.phoneNumber,
    this.houseAddress,
    this.houseArea,
    this.housePrice,
    this.westSide,
    this.northSide,
    this.southSide,
    this.eastSide);

//  factory LandModel.fromJson(Map<String,dynamic> json){
//
//    return LandModel(
//      id: json['id'],
//      statues: json['statues'],
//      ownerName: json['ownerName'],
//      phoneNumber: json['phoneNumber'],
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