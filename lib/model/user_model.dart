
class UserModel {
  UserModel({
    required this.token,
  });
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}