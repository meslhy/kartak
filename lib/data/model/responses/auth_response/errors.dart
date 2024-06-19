/// errors : [{"type":"field","value":"meslhy2@gmail.com","msg":"email is existed","path":"email","location":"body"},{"type":"field","value":"123456","msg":"passwordConfim is not match","path":"password","location":"body"}]

class Errors {
  Errors({
      this.errors,});

  Errors.fromJson(dynamic json) {
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ErrorsData.fromJson(v));
      });
    }
  }
  List<ErrorsData>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "field"
/// value : "meslhy2@gmail.com"
/// msg : "email is existed"
/// path : "email"
/// location : "body"

class ErrorsData {
  ErrorsData({
      this.type, 
      this.value, 
      this.msg, 
      this.path, 
      this.location,});

  ErrorsData.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
    msg = json['msg'];
    path = json['path'];
    location = json['location'];
  }
  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    map['msg'] = msg;
    map['path'] = path;
    map['location'] = location;
    return map;
  }

}