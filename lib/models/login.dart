class Login{
  final String success;
  final String userName;
  final String phoneNumber;

  Login({this.success,this.phoneNumber,this.userName});


  factory Login.fromJson(Map<String,dynamic> json){

    return Login(
      success: json['success'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
    );
  }
}