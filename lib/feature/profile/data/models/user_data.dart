class UserData {
  Data? data;
  Support? support;

  UserData({this.data, this.support});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    support =
        json["support"] == null ? null : Support.fromJson(json["support"]);
  }

  static List<UserData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    if (support != null) {
      _data["support"] = support?.toJson();
    }
    return _data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    text = json["text"];
  }

  static List<Support> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Support.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["text"] = text;
    return _data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    avatar = json["avatar"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["email"] = email;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["avatar"] = avatar;
    return _data;
  }
}
