/// data : {"name":"meslhy","email":"meslhy1@gmail.com","password":"$2b$12$KK9DaEtne33zLp.bYz20QuKz4OGSc891mSgdNn7eXSJCnGpOzDsJS","role":"user","active":true,"wishlist":[],"_id":"65e4a797acbda3e18a8df9e5","addresses":[],"createdAt":"2024-03-03T16:38:47.525Z","updatedAt":"2024-03-03T16:38:47.525Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWU0YTc5N2FjYmRhM2UxOGE4ZGY5ZTUiLCJpYXQiOjE3MDk0ODM5MjksImV4cCI6MTcwOTU3MDMyOX0.f6llyNNryuLQn67UQDZWoty5edawWeuyPjXWFBJYERQ"

class AuthResponse {
  AuthResponse({
      this.data, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }
  UserData? data;
  String? token;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['message'] = message;
    return map;
  }

}

/// name : "meslhy"
/// email : "meslhy1@gmail.com"
/// password : "$2b$12$KK9DaEtne33zLp.bYz20QuKz4OGSc891mSgdNn7eXSJCnGpOzDsJS"
/// role : "user"
/// active : true
/// wishlist : []
/// _id : "65e4a797acbda3e18a8df9e5"
/// addresses : []
/// createdAt : "2024-03-03T16:38:47.525Z"
/// updatedAt : "2024-03-03T16:38:47.525Z"
/// __v : 0

class UserData {
  UserData({
      this.name, 
      this.email, 
      this.password, 
      this.role, 
      this.active, 
      this.wishlist, 
      this.id, 
      this.addresses, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  UserData.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    if (json['wishlist'] != null) {
      wishlist = [];
      json['wishlist'].forEach((v) {
        wishlist?.add(UserData.fromJson(v));
      });
    }
    id = json['_id'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(UserData.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['active'] = active;
    if (wishlist != null) {
      map['wishlist'] = wishlist?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}