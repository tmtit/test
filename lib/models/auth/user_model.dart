class UserModel {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? firstName;
  String? lastName;
  String? address;
  String? phone;
  String? positionId;
  String? description;
  String? birthday;
  String? noID;
  String? divisionId;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.firstName,
    this.lastName,
    this.address,
    this.phone,
    this.positionId,
    this.description,
    this.birthday,
    this.noID,
    this.divisionId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phone = json['phone'];
    positionId = json['position_id'];
    description = json['description'];
    birthday = json['birthday'];
    noID = json['no_id'];
    divisionId = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['phone'] = phone;
    data['position_id'] = positionId;
    data['description'] = description;
    data['birthday'] = birthday;
    data['no_id'] = noID;
    data['division_id'] = divisionId;
    return data;
  }
}
