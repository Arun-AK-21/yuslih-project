import 'dart:convert';
CarpenterApi carpenterApiFromJson(String str) => CarpenterApi.fromJson(json.decode(str));
String carpenterApiToJson(CarpenterApi data) => json.encode(data.toJson());
class CarpenterApi {
  CarpenterApi({
      this.record,});

  CarpenterApi.fromJson(dynamic json) {
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(Record.fromJson(v));
      });
    }
  }
  List<Record>? record;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (record != null) {
      map['record'] = record?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Record recordFromJson(String str) => Record.fromJson(json.decode(str));
String recordToJson(Record data) => json.encode(data.toJson());
class Record {
  Record({
      this.id, 
      this.name, 
      this.category, 
      this.price,});

  Record.fromJson(dynamic json) {
    id = json['id'];
    name = json['Name'];
    category = json['Category'];
    price = json['Price'];
  }
  num? id;
  String? name;
  String? category;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Name'] = name;
    map['Category'] = category;
    map['Price'] = price;
    return map;
  }

}