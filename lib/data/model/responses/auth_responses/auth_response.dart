/// status : "success"
/// Data : {"cloudImage":{"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null},"_id":"660941a12098534516c63e4e","name":"meslhy","slug":"meslhy","email":"meslhy@gmail.com","phone":"01146197496","profileImage":"user-9db833be-f859-41d3-8625-e6c7d1d2f870-1711882656856.jpeg","password":"$2b$12$koi6LYZrR3S74vBWTUYtauDlAuFs8Oa14RCuHS3qKLD8C6nX5n1la","role":"user","active":true,"createdAt":"2024-03-31T10:57:37.147Z","updatedAt":"2024-03-31T10:57:37.147Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjA5NDFhMTIwOTg1MzQ1MTZjNjNlNGUiLCJpYXQiOjE3MTMyODM3NjksImV4cCI6MTcxMzM3MDE2OX0.avRJYmR6i8qwhYC3iThCYAIIOqy1q-SpGfYYzLL717E"

class AuthResponse {
  AuthResponse({
      this.status, 
      this.data, 
      this.token,
  this.message
  });

  AuthResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['Data'] != null ? UserData.fromJson(json['Data']) : null;
    token = json['token'];
    message = json['message'];
  }
  String? status;
  UserData? data;
  String? token;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// cloudImage : {"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null}
/// _id : "660941a12098534516c63e4e"
/// name : "meslhy"
/// slug : "meslhy"
/// email : "meslhy@gmail.com"
/// phone : "01146197496"
/// profileImage : "user-9db833be-f859-41d3-8625-e6c7d1d2f870-1711882656856.jpeg"
/// password : "$2b$12$koi6LYZrR3S74vBWTUYtauDlAuFs8Oa14RCuHS3qKLD8C6nX5n1la"
/// role : "user"
/// active : true
/// createdAt : "2024-03-31T10:57:37.147Z"
/// updatedAt : "2024-03-31T10:57:37.147Z"
/// __v : 0

class UserData {
  UserData({
      this.cloudImage, 
      this.id, 
      this.name, 
      this.slug, 
      this.email, 
      this.phone, 
      this.profileImage, 
      this.password, 
      this.role, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  UserData.fromJson(dynamic json) {
    cloudImage = json['cloudImage'] != null ? CloudImage.fromJson(json['cloudImage']) : null;
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  CloudImage? cloudImage;
  String? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? profileImage;
  String? password;
  String? role;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cloudImage != null) {
      map['cloudImage'] = cloudImage?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['email'] = email;
    map['phone'] = phone;
    map['profileImage'] = profileImage;
    map['password'] = password;
    map['role'] = role;
    map['active'] = active;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

/// url : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
/// publicId : null

class CloudImage {
  CloudImage({
      this.url, 
      this.publicId,});

  CloudImage.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['publicId'];
  }
  String? url;
  dynamic publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['publicId'] = publicId;
    return map;
  }

}