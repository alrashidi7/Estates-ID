class LandModel{
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

  LandModel({
    this.id,
    this.statues,
    this.ownerName,
    this.phoneNumber,
    this.address,
    this.area,
    this.price,
    this.westSide,
    this.northSide,
    this.southSide,
    this.eastSide});


  factory LandModel.fromJson(Map<String,dynamic> json){
    return LandModel(
      id: json['id'],
      statues: json['statues'],
      ownerName: json['ownerName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      area: json['area'],
      price: json['price'],
      westSide: json['westSide'],
      northSide: json['northSide'],
      southSide: json['southSide'],
      eastSide: json['eastSide'],
    );
  }
}