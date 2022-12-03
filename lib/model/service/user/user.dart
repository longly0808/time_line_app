class UserModel {
  String? id;
  String? userName;
  String? phoneNumber;
  String? urlImage;
  String? mail;
  String? info;

  UserModel({
    this.id,
    this.userName,
    this.phoneNumber,
    this.urlImage,
    this.mail,
    this.info,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        userName: json['userName'],
        phoneNumber: json['phoneNumber'],
        mail: json['mail'],
        info: json['info'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'mail': mail,
        'info': info,
        'urlImage': urlImage
      };
}
