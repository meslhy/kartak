/// status : "success"
/// data : [{"_id":"6679ffc82acf2548c46b5ccc","user":"6672a5079a49f099c036a7ef","place":"65fa1d17381ab5d2f03c69ae","paymentTypeMethod":"cash","paidAt":"2024-06-24T23:22:48.114Z","totalPrice":200,"totalPriceAfterDiscount":190,"owner":"mohammed elnassag","cashBack":10,"createdAt":"2024-06-24T23:22:48.120Z","updatedAt":"2024-06-24T23:22:48.120Z","__v":0}]

class TransactionsResponse {
  TransactionsResponse({
      this.status, 
      this.data,});

  TransactionsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TransactionData.fromJson(v));
      });
    }
  }
  String? status;
  List<TransactionData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6679ffc82acf2548c46b5ccc"
/// user : "6672a5079a49f099c036a7ef"
/// place : "65fa1d17381ab5d2f03c69ae"
/// paymentTypeMethod : "cash"
/// paidAt : "2024-06-24T23:22:48.114Z"
/// totalPrice : 200
/// totalPriceAfterDiscount : 190
/// owner : "mohammed elnassag"
/// cashBack : 10
/// createdAt : "2024-06-24T23:22:48.120Z"
/// updatedAt : "2024-06-24T23:22:48.120Z"
/// __v : 0

class TransactionData {
  TransactionData({
      this.id, 
      this.user, 
      this.place, 
      this.paymentTypeMethod, 
      this.paidAt, 
      this.totalPrice, 
      this.totalPriceAfterDiscount, 
      this.owner, 
      this.cashBack, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  TransactionData.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    place = json['place'];
    paymentTypeMethod = json['paymentTypeMethod'];
    paidAt = json['paidAt'];
    totalPrice = json['totalPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
    owner = json['owner'];
    cashBack = json['cashBack'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? user;
  String? place;
  String? paymentTypeMethod;
  String? paidAt;
  num? totalPrice;
  num? totalPriceAfterDiscount;
  String? owner;
  num? cashBack;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    map['place'] = place;
    map['paymentTypeMethod'] = paymentTypeMethod;
    map['paidAt'] = paidAt;
    map['totalPrice'] = totalPrice;
    map['totalPriceAfterDiscount'] = totalPriceAfterDiscount;
    map['owner'] = owner;
    map['cashBack'] = cashBack;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}