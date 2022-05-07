import 'dart:convert';

ArayaImageModel pewayanganImageModelFromJson(String str) =>
    ArayaImageModel.fromJson(json.decode(str));

String pewayanganImageModelToJson(ArayaImageModel data) =>
    json.encode(data.toJson());

class ArayaImageModel {
  ArayaImageModel({
    this.url = '',
    this.width = 24.0,
    this.height = 24.0,
    this.alt = '',
  });

  String url;
  double width;
  double height;
  String alt;

  factory ArayaImageModel.fromJson(Map<String, dynamic> json) =>
      ArayaImageModel(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "alt": alt,
      };
}
