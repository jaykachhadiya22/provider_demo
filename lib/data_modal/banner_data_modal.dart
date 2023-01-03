// To parse this JSON data, do
//
//     final bannerDataModal = bannerDataModalFromJson(jsonString);

import 'dart:convert';

BannerDataModal bannerDataModalFromJson(String str) => BannerDataModal.fromJson(json.decode(str));

String bannerDataModalToJson(BannerDataModal data) => json.encode(data.toJson());

class BannerDataModal {
  BannerDataModal({
    required this.uri,
  });

  String uri;

  factory BannerDataModal.fromJson(Map<String, dynamic> json) => BannerDataModal(
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
  };
}
