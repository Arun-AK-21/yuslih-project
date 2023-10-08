import 'dart:convert';
PainterApi painterApiFromJson(String str) => PainterApi.fromJson(json.decode(str));
String painterApiToJson(PainterApi data) => json.encode(data.toJson());
class PainterApi {
  PainterApi({
      this.record,});

  PainterApi.fromJson(dynamic json) {
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(Record1.fromJson(v));
      });
    }
  }
  List<Record1>? record;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (record != null) {
      map['record'] = record?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Record1 recordFromJson(String str) => Record1.fromJson(json.decode(str));
String recordToJson(Record1 data) => json.encode(data.toJson());
class Record1 {
  Record1({
      this.id, 
      this.name, 
      this.category, 
      this.price,});

  Record1.fromJson(dynamic json) {
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