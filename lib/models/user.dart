class User{
  String name;
  int id;

  User(this.name, this.id);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['name'],
        json['id']
    );
  }
}