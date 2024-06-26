/// status : "success"
/// data : {"userData":{"_id":"6672a5079a49f099c036a7ef","name":"yousef meslhy","slug":"yousef-meslhy","email":"useifmeslhy@gmail.com","phone":"01146197496","profileImage":"user-95c6097d-9638-40eb-9117-be9a72a6d714-1718789382429.jpeg","role":"user","createdAt":"2024-06-19T09:29:43.146Z","updatedAt":"2024-06-26T00:32:17.167Z","__v":0,"cloudImage":{"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null},"passwordResetToken":"ddd49ce81c286ef71a384cc786965f06705de11c9cb5f37fb7acdb06cbc8c3ea","passwordResetTokenExpired":"2024-06-19T10:51:38.951Z","cashBack":0,"passwordChangedAt":"2024-06-25T21:38:08.146Z","passwordResetCode":"005d2a958bdb9cd89917f0d347f24ede","passwordResetExpires":"1719362537104","passwordResetVerified":"false"}}

class ProfileResponse {
  ProfileResponse({
      this.status, 
      this.data,});

  ProfileResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
  String? status;
  ProfileData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// userData : {"_id":"6672a5079a49f099c036a7ef","name":"yousef meslhy","slug":"yousef-meslhy","email":"useifmeslhy@gmail.com","phone":"01146197496","profileImage":"user-95c6097d-9638-40eb-9117-be9a72a6d714-1718789382429.jpeg","role":"user","createdAt":"2024-06-19T09:29:43.146Z","updatedAt":"2024-06-26T00:32:17.167Z","__v":0,"cloudImage":{"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null},"passwordResetToken":"ddd49ce81c286ef71a384cc786965f06705de11c9cb5f37fb7acdb06cbc8c3ea","passwordResetTokenExpired":"2024-06-19T10:51:38.951Z","cashBack":0,"passwordChangedAt":"2024-06-25T21:38:08.146Z","passwordResetCode":"005d2a958bdb9cd89917f0d347f24ede","passwordResetExpires":"1719362537104","passwordResetVerified":"false"}

class ProfileData {
  ProfileData({
      this.userData,});

  ProfileData.fromJson(dynamic json) {
    userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
  }
  UserData? userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userData != null) {
      map['userData'] = userData?.toJson();
    }
    return map;
  }

}

/// _id : "6672a5079a49f099c036a7ef"
/// name : "yousef meslhy"
/// slug : "yousef-meslhy"
/// email : "useifmeslhy@gmail.com"
/// phone : "01146197496"
/// profileImage : "user-95c6097d-9638-40eb-9117-be9a72a6d714-1718789382429.jpeg"
/// role : "user"
/// createdAt : "2024-06-19T09:29:43.146Z"
/// updatedAt : "2024-06-26T00:32:17.167Z"
/// __v : 0
/// cloudImage : {"url":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png","publicId":null}
/// passwordResetToken : "ddd49ce81c286ef71a384cc786965f06705de11c9cb5f37fb7acdb06cbc8c3ea"
/// passwordResetTokenExpired : "2024-06-19T10:51:38.951Z"
/// cashBack : 0
/// passwordChangedAt : "2024-06-25T21:38:08.146Z"
/// passwordResetCode : "005d2a958bdb9cd89917f0d347f24ede"
/// passwordResetExpires : "1719362537104"
/// passwordResetVerified : "false"

class UserData {
  UserData({
      this.id, 
      this.name, 
      this.slug, 
      this.email, 
      this.phone, 
      this.profileImage, 
      this.role, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.cloudImage, 
      this.passwordResetToken, 
      this.passwordResetTokenExpired, 
      this.cashBack, 
      this.passwordChangedAt, 
      this.passwordResetCode, 
      this.passwordResetExpires, 
      this.passwordResetVerified,});

  UserData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    cloudImage = json['cloudImage'] != null ? CloudImage.fromJson(json['cloudImage']) : null;
    passwordResetToken = json['passwordResetToken'];
    passwordResetTokenExpired = json['passwordResetTokenExpired'];
    cashBack = json['cashBack'];
    passwordChangedAt = json['passwordChangedAt'];
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
  String? role;
  String? createdAt;
  String? updatedAt;
  int? v;
  CloudImage? cloudImage;
  String? passwordResetToken;
  String? passwordResetTokenExpired;
  int? cashBack;
  String? passwordChangedAt;
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
    map['role'] = role;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    if (cloudImage != null) {
      map['cloudImage'] = cloudImage?.toJson();
    }
    map['passwordResetToken'] = passwordResetToken;
    map['passwordResetTokenExpired'] = passwordResetTokenExpired;
    map['cashBack'] = cashBack;
    map['passwordChangedAt'] = passwordChangedAt;
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['passwordResetVerified'] = passwordResetVerified;
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