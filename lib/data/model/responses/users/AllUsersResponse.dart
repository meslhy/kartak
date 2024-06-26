/// length : 1
/// status : "success"
/// data : [{"cloudImage":{"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null},"_id":"667b9c2ce9b3aa2aacbc024b","name":"yousef meslhy","slug":"yousef-meslhy","email":"useifmeslhy@gmail.com","phone":"01146197496","profileImage":"user-3cd2f868-7189-4b08-a362-5e3e893dd78c-1719376940304.jpeg","password":"$2b$12$.6BVUAgXnMu7r29HjoIACus4pAdzHMhQ.C2joIE1TduWSALxC2QCi","role":"user","active":true,"cashBack":0,"createdAt":"2024-06-26T04:42:20.579Z","updatedAt":"2024-06-26T04:42:20.579Z","__v":0}]

class AllUsersResponse {
  AllUsersResponse({
      this.length, 
      this.status, 
      this.data,});

  AllUsersResponse.fromJson(dynamic json) {
    length = json['length'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UsersData.fromJson(v));
      });
    }
  }
  int? length;
  String? status;
  String? message;
  List<UsersData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// cloudImage : {"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null}
/// _id : "667b9c2ce9b3aa2aacbc024b"
/// name : "yousef meslhy"
/// slug : "yousef-meslhy"
/// email : "useifmeslhy@gmail.com"
/// phone : "01146197496"
/// profileImage : "user-3cd2f868-7189-4b08-a362-5e3e893dd78c-1719376940304.jpeg"
/// password : "$2b$12$.6BVUAgXnMu7r29HjoIACus4pAdzHMhQ.C2joIE1TduWSALxC2QCi"
/// role : "user"
/// active : true
/// cashBack : 0
/// createdAt : "2024-06-26T04:42:20.579Z"
/// updatedAt : "2024-06-26T04:42:20.579Z"
/// __v : 0

class UsersData {
  UsersData({
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
      this.cashBack, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  UsersData.fromJson(dynamic json) {
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
    cashBack = json['cashBack'];
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
  int? cashBack;
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
    map['cashBack'] = cashBack;
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