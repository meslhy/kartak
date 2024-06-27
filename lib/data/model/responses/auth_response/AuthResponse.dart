/// status : "success"
/// Data : {"_id":"667caba3edbf7e5a82fa78e7","name":"yousef meslhy","slug":"yousef-meslhy","email":"useifmeslhy@gmail.com","phone":"01146197496","profileImage":"user-956c6dd9-6498-4649-b833-6e25383bc5e2-1719446433882.jpeg","password":"$2b$12$wskB4LMQFC8iW6iPDE6zauJ7k4JONQbv6iJA8J7q6uzbluqGAuV1i","confirmPassword":"123456","role":"user","active":true,"cashBack":0,"cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719446434/isiz8flpy9cxhot7tg0d.jpg","publicId":"isiz8flpy9cxhot7tg0d"},"createdAt":"2024-06-27T00:00:35.034Z","updatedAt":"2024-06-27T00:00:35.034Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjdjYWJhM2VkYmY3ZTVhODJmYTc4ZTciLCJpYXQiOjE3MTk0NDY2MTgsImV4cCI6MTcxOTUzMzAxOH0.NJFaOytfbxe7QJ-laxuYXMgu4OYOoeDV-sx3vDQjWwU"

class AuthResponse {
  AuthResponse({
      this.status, 
      this.data, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['Data'] != null ? AuthData.fromJson(json['Data']) : null;
    token = json['token'];
    message = json['message'];
  }
  String? status;
  AuthData? data;
  String? token;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    map['token'] = token;
    map['message'] = message;
    return map;
  }

}

/// _id : "667caba3edbf7e5a82fa78e7"
/// name : "yousef meslhy"
/// slug : "yousef-meslhy"
/// email : "useifmeslhy@gmail.com"
/// phone : "01146197496"
/// profileImage : "user-956c6dd9-6498-4649-b833-6e25383bc5e2-1719446433882.jpeg"
/// password : "$2b$12$wskB4LMQFC8iW6iPDE6zauJ7k4JONQbv6iJA8J7q6uzbluqGAuV1i"
/// confirmPassword : "123456"
/// role : "user"
/// active : true
/// cashBack : 0
/// cloudImage : {"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719446434/isiz8flpy9cxhot7tg0d.jpg","publicId":"isiz8flpy9cxhot7tg0d"}
/// createdAt : "2024-06-27T00:00:35.034Z"
/// updatedAt : "2024-06-27T00:00:35.034Z"
/// __v : 0

class AuthData {
  AuthData({
      this.id, 
      this.name, 
      this.slug, 
      this.email, 
      this.phone, 
      this.profileImage, 
      this.password, 
      this.confirmPassword, 
      this.role, 
      this.active, 
      this.cashBack, 
      this.cloudImage, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  AuthData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    role = json['role'];
    active = json['active'];
    cashBack = json['cashBack'];
    cloudImage = json['cloudImage'] != null ? CloudImage.fromJson(json['cloudImage']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? profileImage;
  String? password;
  String? confirmPassword;
  String? role;
  bool? active;
  num? cashBack;
  CloudImage? cloudImage;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['email'] = email;
    map['phone'] = phone;
    map['profileImage'] = profileImage;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['role'] = role;
    map['active'] = active;
    map['cashBack'] = cashBack;
    if (cloudImage != null) {
      map['cloudImage'] = cloudImage?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dofdohxgb/image/upload/v1719446434/isiz8flpy9cxhot7tg0d.jpg"
/// publicId : "isiz8flpy9cxhot7tg0d"

class CloudImage {
  CloudImage({
      this.url, 
      this.publicId,});

  CloudImage.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['publicId'];
  }
  String? url;
  String? publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['publicId'] = publicId;
    return map;
  }

}