// To parse this JSON data, do
//
//     final animalCategoryrItemsDataModal = animalCategoryrItemsDataModalFromJson(jsonString);

import 'dart:convert';

AnimalCategoryrItemsDataModal animalCategoryrItemsDataModalFromJson(String str) => AnimalCategoryrItemsDataModal.fromJson(json.decode(str));

String animalCategoryrItemsDataModalToJson(AnimalCategoryrItemsDataModal data) => json.encode(data.toJson());

class AnimalCategoryrItemsDataModal {
  AnimalCategoryrItemsDataModal({
    required this.cid,
    required this.gender,
    required this.name,
    required this.shopename,
    required this.uri,
  });

  String cid;
  String gender;
  String name;
  String shopename;
  String uri;

  factory AnimalCategoryrItemsDataModal.fromJson(Map<String, dynamic> json) => AnimalCategoryrItemsDataModal(
    cid: json["cid"],
    gender: json["gender"],
    name: json["name"],
    shopename: json["shopename"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "gender": gender,
    "name": name,
    "shopename": shopename,
    "uri": uri,
  };
}
