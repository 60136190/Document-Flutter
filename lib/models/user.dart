class User {
  String id;
  final String fullname;
  final String email;
  final String address;
  final String password;

  User(
      {this.id = '',
      required this.fullname,
      required this.email,
      required this.address,
      required this.password});

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'email': email,
        'address': address,
        'password': password,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullname: json['fullname'],
        email: json['email'],
        address: json['address'],
        password: json['password'],
      );
}
