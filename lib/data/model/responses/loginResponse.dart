/// status : "success"
/// data : {"status":"success","userData":{"avatar":"uploads/avatar_1.png","_id":"6575be611dd9796e20778715","firstName":"youssef","lastName":"elaalem","password":"$2a$10$qpq3ZtscbpeCr1FYA0yvUeY2OoO1sZc1hJ.77AjHk8q8iXDN8khAW","email":"youssef2@gmail.com","role":"ADMIN","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlvdXNzZWYyQGdtYWlsLmNvbSIsIl9pZCI6IjY1NzViZTYxMWRkOTc5NmUyMDc3ODcxNSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTcwMjIxNTI2NSwiZXhwIjoxNzAyMjE1NDQ1fQ.plbiNFBQG7cYTHH-2GsAqFi826zCAj1_mGG88MHdY-U","__v":0},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlvdXNzZWYyQGdtYWlsLmNvbSIsIl9pZCI6IjY1NzViZTYxMWRkOTc5NmUyMDc3ODcxNSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTcwNjAyODE4OCwiZXhwIjoxNzA2MTE0NTg4fQ.jLFTkb9yeuh7lVXgzr0kYpUCCuyN4RhhJyx02PQJWKQ"}

class LoginResponse {
  LoginResponse({
      this.status, 
      this.data,
    this.message,
    this.code,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? LoginResponseData.fromJson(json['data']) : null;
  }
  String? status;
  LoginResponseData? data;
  String? message;
  int? code;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// status : "success"
/// userData : {"avatar":"uploads/avatar_1.png","_id":"6575be611dd9796e20778715","firstName":"youssef","lastName":"elaalem","password":"$2a$10$qpq3ZtscbpeCr1FYA0yvUeY2OoO1sZc1hJ.77AjHk8q8iXDN8khAW","email":"youssef2@gmail.com","role":"ADMIN","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlvdXNzZWYyQGdtYWlsLmNvbSIsIl9pZCI6IjY1NzViZTYxMWRkOTc5NmUyMDc3ODcxNSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTcwMjIxNTI2NSwiZXhwIjoxNzAyMjE1NDQ1fQ.plbiNFBQG7cYTHH-2GsAqFi826zCAj1_mGG88MHdY-U","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlvdXNzZWYyQGdtYWlsLmNvbSIsIl9pZCI6IjY1NzViZTYxMWRkOTc5NmUyMDc3ODcxNSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTcwNjAyODE4OCwiZXhwIjoxNzA2MTE0NTg4fQ.jLFTkb9yeuh7lVXgzr0kYpUCCuyN4RhhJyx02PQJWKQ"

class LoginResponseData {
  LoginResponseData({
    this.message,
      this.status, 
      this.userData, 
      this.token,});

  LoginResponseData.fromJson(dynamic json) {
    status = json['status'];
    userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    token = json['token'];
  }
  String? status;
  UserData? userData;
  String? token;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (userData != null) {
      map['userData'] = userData?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// avatar : "uploads/avatar_1.png"
/// _id : "6575be611dd9796e20778715"
/// firstName : "youssef"
/// lastName : "elaalem"
/// password : "$2a$10$qpq3ZtscbpeCr1FYA0yvUeY2OoO1sZc1hJ.77AjHk8q8iXDN8khAW"
/// email : "youssef2@gmail.com"
/// role : "ADMIN"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlvdXNzZWYyQGdtYWlsLmNvbSIsIl9pZCI6IjY1NzViZTYxMWRkOTc5NmUyMDc3ODcxNSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTcwMjIxNTI2NSwiZXhwIjoxNzAyMjE1NDQ1fQ.plbiNFBQG7cYTHH-2GsAqFi826zCAj1_mGG88MHdY-U"
/// __v : 0

class UserData {
  UserData({
      this.avatar, 
      this.id, 
      this.firstName, 
      this.lastName, 
      this.password, 
      this.email, 
      this.role, 
      this.token, 
      this.v,});

  UserData.fromJson(dynamic json) {
    avatar = json['avatar'];
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
    v = json['__v'];
  }
  String? avatar;
  String? id;
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? role;
  String? token;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['password'] = password;
    map['email'] = email;
    map['role'] = role;
    map['token'] = token;
    map['__v'] = v;
    return map;
  }

}