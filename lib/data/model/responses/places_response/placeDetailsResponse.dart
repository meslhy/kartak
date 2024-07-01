/// data : {"_id":"65fa1d17381ab5d2f03c69ae","name":"Polar","slug":"polar","description":"A cafe where you will find everything you need, from food of the highest quality to its location, which will keep you looking up to the sky, other than the largest screen for displaying matches in Shebin.","discount":5,"imageCover":"place-26ad22fd-d84b-49fe-a904-973f4cc0a8fb-1710890261082.jpeg","categore":"Cafe & Resurants","ratingQuantity":0,"cloudImage":{"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1710890277/ly86a5i2johm6386pbil.jpg","publicId":"ly86a5i2johm6386pbil"},"createdAt":"2024-03-19T23:17:43.582Z","updatedAt":"2024-03-19T23:17:43.582Z","__v":0,"code":"7T4K2J-H9N3P-W1B7X8","owner":"mohammed elnassag"}

class PlaceDetailsResponse {
  PlaceDetailsResponse({
      this.data,});

  PlaceDetailsResponse.fromJson(dynamic json) {
    data = json['data'] != null ? PlaceDetailsData.fromJson(json['data']) : null;
    message = json['message'];
  }
  PlaceDetailsData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
      map['message'] = message;
    }
    return map;

  }


}

/// _id : "65fa1d17381ab5d2f03c69ae"
/// name : "Polar"
/// slug : "polar"
/// description : "A cafe where you will find everything you need, from food of the highest quality to its location, which will keep you looking up to the sky, other than the largest screen for displaying matches in Shebin."
/// discount : 5
/// imageCover : "place-26ad22fd-d84b-49fe-a904-973f4cc0a8fb-1710890261082.jpeg"
/// categore : "Cafe & Resurants"
/// ratingQuantity : 0
/// cloudImage : {"url":"https://res.cloudinary.com/dofdohxgb/image/upload/v1710890277/ly86a5i2johm6386pbil.jpg","publicId":"ly86a5i2johm6386pbil"}
/// createdAt : "2024-03-19T23:17:43.582Z"
/// updatedAt : "2024-03-19T23:17:43.582Z"
/// __v : 0
/// code : "7T4K2J-H9N3P-W1B7X8"
/// owner : "mohammed elnassag"

class PlaceDetailsData {
  PlaceDetailsData({
      this.id, 
      this.name, 
      this.slug, 
      this.description, 
      this.discount, 
      this.imageCover, 
      this.categore, 
      this.ratingQuantity, 
      this.cloudImage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.code, 
      this.owner,});

  PlaceDetailsData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    discount = json['discount'];
    imageCover = json['imageCover'];
    categore = json['categore'];
    ratingQuantity = json['ratingQuantity'];
    rate = json['rate'];
    cloudImage = json['cloudImage'] != null ? CloudImage.fromJson(json['cloudImage']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    code = json['code'];
    owner = json['owner'];
  }
  String? id;
  String? name;
  String? slug;
  String? description;
  num? discount;
  String? imageCover;
  String? categore;
  int? ratingQuantity;
  CloudImage? cloudImage;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? code;
  String? owner;
  num? rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['discount'] = discount;
    map['imageCover'] = imageCover;
    map['categore'] = categore;
    map['ratingQuantity'] = ratingQuantity;
    if (cloudImage != null) {
      map['cloudImage'] = cloudImage?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['code'] = code;
    map['owner'] = owner;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dofdohxgb/image/upload/v1710890277/ly86a5i2johm6386pbil.jpg"
/// publicId : "ly86a5i2johm6386pbil"

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