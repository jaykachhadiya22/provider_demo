// To parse this JSON data, do
//
//     final animalCategoryrDataModal = animalCategoryrDataModalFromJson(jsonString);

import 'dart:convert';

AnimalCategoryrDataModal animalCategoryrDataModalFromJson(String str) => AnimalCategoryrDataModal.fromJson(json.decode(str));

String animalCategoryrDataModalToJson(AnimalCategoryrDataModal data) => json.encode(data.toJson());

class AnimalCategoryrDataModal {
  AnimalCategoryrDataModal({
    required this.aname,
    required this.cid
  });

  String aname;
  String cid;

  factory AnimalCategoryrDataModal.fromJson(Map<String, dynamic> json) => AnimalCategoryrDataModal(
    aname: json["aname"],
    cid: json["cid"]
  );

  Map<String, dynamic> toJson() => {
    "aname": aname,
    "cid": cid,
  };
}
