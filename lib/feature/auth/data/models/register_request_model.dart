class RegisterRequestModel {

  String name;
  String email;
  String password;
  String confirmpassword;
  String? city;
  String? address;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
    this.city,
    this.address,
  });

   toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmpassword,
      'address': address,
      'city': city,
    };
  }

}