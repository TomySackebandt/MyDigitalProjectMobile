class User{
  int id;
  String firstname;
  String lastname;
  String email;
  int phone;

  User(this.firstname, this.id, this.email, [this.lastname = "", this.phone = 0]);

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'id': id,
      'email': email
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['firstname'],
        json['id'],
        json['email'],
    );
  }
}