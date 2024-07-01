/// status : "success"
/// length : 17
/// data : [{"_id":"667891b97fed63db4936e79d","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667891bb7fed63db4936e7a1","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667891bd7fed63db4936e7a5","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c4ac2b05a2b2d6d78da3","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c4b0dfabd499e2da1c4f","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c4cfb99292cd04222874","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c4ebc821a2f1b3dc78cb","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c5622e604bcb85f3de0c","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c5899b7cd38fabfa75eb","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c596a6991b9c0b5afc9a","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c5a6ee4d941702635ed0","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c64d46793a932f2c365c","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"6678c65746793a932f2c3664","title":"jjjjjjjjjjjjjjjjjjj","rate":3,"user":"660aa8f9f941a2ff0a77f0a5","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667d87fd5f15ef4b37d7bff6","title":"this comment done by youssef","rate":3,"user":"667d87085f15ef4b37d7bff1","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667d88965f15ef4b37d7bffe","title":"this comment done by youssef","rate":3,"user":"667d87085f15ef4b37d7bff1","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667ff2bdf5c0a52c603f3459","title":"this comment done by youssef","rate":3,"user":"667caba3edbf7e5a82fa78e7","place":"65fa1d17381ab5d2f03c69ae","__v":0},{"_id":"667fff9f524f84bb6841db83","title":"kjdjijfi","rate":3,"user":"667caba3edbf7e5a82fa78e7","place":"65fa1d17381ab5d2f03c69ae","__v":0}]

class PlaceCommentsResponse {
  PlaceCommentsResponse({
      this.status, 
      this.length, 
      this.data,});

  PlaceCommentsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
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
    map['message'] = message;
    map['length'] = length;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "667891b97fed63db4936e79d"
/// title : "jjjjjjjjjjjjjjjjjjj"
/// rate : 3
/// user : "660aa8f9f941a2ff0a77f0a5"
/// place : "65fa1d17381ab5d2f03c69ae"
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
    user = json['user'];
    place = json['place'];
    v = json['__v'];
  }
  String? id;
  String? title;
  num? rate;
  String? user;
  String? place;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['rate'] = rate;
    map['user'] = user;
    map['place'] = place;
    map['__v'] = v;
    return map;
  }

}