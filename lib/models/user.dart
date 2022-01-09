class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
//hello world
  User({required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password});

  factory User.fromJson(Map<String,dynamic> json)
  {
    return User(
      id: json['Id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['PhoneNumber'],
      email: json['Email'],
      password: json['Password']
    );
  }
  Map<String,dynamic> toJson()=>{
    'Id':id,
    'FirstName':firstName,
    'LastName':lastName,
    'PhoneNumber':phone,
    'Email':email,
    'Password':password,
  };
  void signIn(email,password){

  }
}
