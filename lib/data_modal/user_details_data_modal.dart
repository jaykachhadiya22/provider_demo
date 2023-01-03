// To parse this JSON data, do
//
//     final userDetailsDataModal = userDetailsDataModalFromJson(jsonString);

import 'dart:convert';

List<UserDetailsDataModal> userDetailsDataModalFromJson(String str) => List<UserDetailsDataModal>.from(json.decode(str).map((x) => UserDetailsDataModal.fromJson(x)));

String userDetailsDataModalToJson(List<UserDetailsDataModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailsDataModal {
  UserDetailsDataModal({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory UserDetailsDataModal.fromJson(Map<String, dynamic> json) => UserDetailsDataModal(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
