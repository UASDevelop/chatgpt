class UserModel {
  String? name;
  String? id;
  String? email;
  UserModel(
      {this.name,
        this.id,
        this.email,
      });
  factory UserModel.toMap(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        id: json["id"],
        email: json["email"],
       );
  }
  Map<String, dynamic> tojson() => {
    "name": name,
    "id": id,
    "email": email,
  };
}
