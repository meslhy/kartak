/// status : "success"
/// length : 2
/// data : [{"_id":"6682fd9ba17fee021779b4ee","title":"روعه","rate":5,"user":{"_id":"667cb712edbf7e5a82fa792d","name":"meslhy","slug":"meslhy","email":"yousefmeslhy12@gmail.com","phone":"01146197496","profileImage":"user-69b71ccf-581c-462f-b531-724640b80a39-1719449359846.jpeg","password":"$2b$12$iYQS95uBLnGRqlILwXgubunXSCDcmCIj8Pa8u3eBqtn61yXyaeSyO","confirmPassword":"123456","role":"user","active":true,"cashBack":355,"cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719613905/f8bmxc585zgh5sxxzw0g.jpg","publicId":"f8bmxc585zgh5sxxzw0g"},"createdAt":"2024-06-27T00:49:23.000Z","updatedAt":"2024-06-29T05:03:42.160Z","__v":0,"passwordResetCode":"f87e8b0c0017ad5993a0f441482d94a9","passwordResetExpires":"1719638022157","passwordResetVerified":"false"},"place":"668231fd0dba0dca5657cd6a","__v":0},{"_id":"6682fda1a17fee021779b4f7","title":"روعه","rate":5,"user":{"_id":"667cb712edbf7e5a82fa792d","name":"meslhy","slug":"meslhy","email":"yousefmeslhy12@gmail.com","phone":"01146197496","profileImage":"user-69b71ccf-581c-462f-b531-724640b80a39-1719449359846.jpeg","password":"$2b$12$iYQS95uBLnGRqlILwXgubunXSCDcmCIj8Pa8u3eBqtn61yXyaeSyO","confirmPassword":"123456","role":"user","active":true,"cashBack":355,"cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719613905/f8bmxc585zgh5sxxzw0g.jpg","publicId":"f8bmxc585zgh5sxxzw0g"},"createdAt":"2024-06-27T00:49:23.000Z","updatedAt":"2024-06-29T05:03:42.160Z","__v":0,"passwordResetCode":"f87e8b0c0017ad5993a0f441482d94a9","passwordResetExpires":"1719638022157","passwordResetVerified":"false"},"place":"668231fd0dba0dca5657cd6a","__v":0}]

class PlaceCommentsResponse {
  PlaceCommentsResponse({
      this.status, 
      this.length, 
      this.data,});

  PlaceCommentsResponse.fromJson(dynamic json) {
    status = json['status'];
    length = json['length'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PlaceCommentData.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  int? length;
  List<PlaceCommentData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['length'] = length;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6682fd9ba17fee021779b4ee"
/// title : "روعه"
/// rate : 5
/// user : {"_id":"667cb712edbf7e5a82fa792d","name":"meslhy","slug":"meslhy","email":"yousefmeslhy12@gmail.com","phone":"01146197496","profileImage":"user-69b71ccf-581c-462f-b531-724640b80a39-1719449359846.jpeg","password":"$2b$12$iYQS95uBLnGRqlILwXgubunXSCDcmCIj8Pa8u3eBqtn61yXyaeSyO","confirmPassword":"123456","role":"user","active":true,"cashBack":355,"cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719613905/f8bmxc585zgh5sxxzw0g.jpg","publicId":"f8bmxc585zgh5sxxzw0g"},"createdAt":"2024-06-27T00:49:23.000Z","updatedAt":"2024-06-29T05:03:42.160Z","__v":0,"passwordResetCode":"f87e8b0c0017ad5993a0f441482d94a9","passwordResetExpires":"1719638022157","passwordResetVerified":"false"}
/// place : "668231fd0dba0dca5657cd6a"
/// __v : 0

class PlaceCommentData {
  PlaceCommentData({
      this.id, 
      this.title, 
      this.rate, 
      this.user, 
      this.place, 
      this.v,});

  PlaceCommentData.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    rate = json['rate'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    place = json['place'];
    v = json['__v'];
  }
  String? id;
  String? title;
  int? rate;
  User? user;
  String? place;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['rate'] = rate;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['place'] = place;
    map['__v'] = v;
    return map;
  }

}

/// _id : "667cb712edbf7e5a82fa792d"
/// name : "meslhy"
/// slug : "meslhy"
/// email : "yousefmeslhy12@gmail.com"
/// phone : "01146197496"
/// profileImage : "user-69b71ccf-581c-462f-b531-724640b80a39-1719449359846.jpeg"
/// password : "$2b$12$iYQS95uBLnGRqlILwXgubunXSCDcmCIj8Pa8u3eBqtn61yXyaeSyO"
/// confirmPassword : "123456"
/// role : "user"
/// active : true
/// cashBack : 355
/// cloudImage : {"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719613905/f8bmxc585zgh5sxxzw0g.jpg","publicId":"f8bmxc585zgh5sxxzw0g"}
/// createdAt : "2024-06-27T00:49:23.000Z"
/// updatedAt : "2024-06-29T05:03:42.160Z"
/// __v : 0
/// passwordResetCode : "f87e8b0c0017ad5993a0f441482d94a9"
/// passwordResetExpires : "1719638022157"
/// passwordResetVerified : "false"

class User {
  User({
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
      this.v, 
      this.passwordResetCode, 
      this.passwordResetExpires, 
      this.passwordResetVerified,});

  User.fromJson(dynamic json) {
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
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetVerified = json['passwordResetVerified'];
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
  int? cashBack;
  CloudImage? cloudImage;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? passwordResetCode;
  String? passwordResetExpires;
  String? passwordResetVerified;

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
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['passwordResetVerified'] = passwordResetVerified;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dofdohxgb/image/upload/v1719613905/f8bmxc585zgh5sxxzw0g.jpg"
/// publicId : "f8bmxc585zgh5sxxzw0g"

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