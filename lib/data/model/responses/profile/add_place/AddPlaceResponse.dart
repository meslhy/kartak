/// data : {"name":"Elmkan","slug":"elmkan","description":"كافيه للاكل والشرب واي حاجه تيجي ف مخك","discount":2,"imageCover":"place-05f7ef05-c993-4092-8407-d47c57045803-1719808508263.jpeg","categore":"cofee","cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719808508/gp7ivjzq8ck5v7ctdvsy.jpg","publicId":"gp7ivjzq8ck5v7ctdvsy"},"owner":"yousef meslhy","code":"yousefmeslhy12","_id":"668231fd0dba0dca5657cd6a","createdAt":"2024-07-01T04:35:09.124Z","updatedAt":"2024-07-01T04:35:09.124Z","__v":0}

class AddPlaceResponse {
  AddPlaceResponse({
      this.data,});

  AddPlaceResponse.fromJson(dynamic json) {
    data = json['data'] != null ? AddPlaceData.fromJson(json['data']) : null;
    message = json['message'];
  }
  AddPlaceData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// name : "Elmkan"
/// slug : "elmkan"
/// description : "كافيه للاكل والشرب واي حاجه تيجي ف مخك"
/// discount : 2
/// imageCover : "place-05f7ef05-c993-4092-8407-d47c57045803-1719808508263.jpeg"
/// categore : "cofee"
/// cloudImage : {"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1719808508/gp7ivjzq8ck5v7ctdvsy.jpg","publicId":"gp7ivjzq8ck5v7ctdvsy"}
/// owner : "yousef meslhy"
/// code : "yousefmeslhy12"
/// _id : "668231fd0dba0dca5657cd6a"
/// createdAt : "2024-07-01T04:35:09.124Z"
/// updatedAt : "2024-07-01T04:35:09.124Z"
/// __v : 0

class AddPlaceData {
  AddPlaceData({
      this.name, 
      this.slug, 
      this.description, 
      this.discount, 
      this.imageCover, 
      this.categore, 
      this.cloudImage, 
      this.owner, 
      this.code, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  AddPlaceData.fromJson(dynamic json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    discount = json['discount'];
    imageCover = json['imageCover'];
    categore = json['categore'];
    cloudImage = json['cloudImage'] != null ? CloudImage.fromJson(json['cloudImage']) : null;
    owner = json['owner'];
    code = json['code'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? name;
  String? slug;
  String? description;
  int? discount;
  String? imageCover;
  String? categore;
  CloudImage? cloudImage;
  String? owner;
  String? code;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['discount'] = discount;
    map['imageCover'] = imageCover;
    map['categore'] = categore;
    if (cloudImage != null) {
      map['cloudImage'] = cloudImage?.toJson();
    }
    map['owner'] = owner;
    map['code'] = code;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dofdohxgb/image/upload/v1719808508/gp7ivjzq8ck5v7ctdvsy.jpg"
/// publicId : "gp7ivjzq8ck5v7ctdvsy"

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