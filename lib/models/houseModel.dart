class HouseModel{
  final String id;
  final String statues;
  final String ownerName;
  final String phoneNumber;
  final String address;
  final String area;
  final String price;
  final String westSide;
  final String northSide;
  final String southSide;
  final String eastSide;
  final String numOfRooms;


  HouseModel(
    {this.id,
    this.statues,
      this.ownerName,
      this.phoneNumber,
      this.numOfRooms,
      this.address,
      this.area,
      this.price,
      this.westSide,
      this.northSide,
      this.southSide,
      this.eastSide});


  factory HouseModel.fromJson(Map<String,dynamic> json){

    return HouseModel(
      id: json['id'],
      statues: json['statues'],
      ownerName: json['ownerName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      numOfRooms: json['numOfRooms'],
      area: json['area'],
      price: json['price'],
      westSide: json['westSide'],
      northSide: json['northSide'],
      southSide: json['southSide'],
      eastSide: json['eastSide'],
    );
  }
}