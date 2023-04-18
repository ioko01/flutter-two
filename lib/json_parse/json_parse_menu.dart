import 'dart:convert';

JsonParseMenu jsonParseMenuFromJson(String str) =>
    JsonParseMenu.fromJson(json.decode(str));

String jsonParseMenuToJson(JsonParseMenu data) => json.encode(data.toJson());

class JsonParseMenu {
  JsonParseMenu(
      {this.name,
      this.description,
      this.price,
      this.detail,
      this.category,
      this.image,
      this.timestamp});

  String? name;
  String? description;
  int? price;
  String? detail;
  String? category;
  String? image;
  int? timestamp;

  factory JsonParseMenu.fromJson(Map<String, dynamic> json) => JsonParseMenu(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        detail: json["detail"],
        category: json["category"],
        image: json["image"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "detail": detail,
        "category": category,
        "image": image,
        "timestamp": timestamp,
      };
}
