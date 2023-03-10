// To parse this JSON data, do
//
//     final fasalApi = fasalApiFromJson(jsonString);

import 'dart:convert';

List<FasalApi> fasalApiFromJson(String str) => List<FasalApi>.from(json.decode(str).map((x) => FasalApi.fromJson(x)));

String fasalApiToJson(List<FasalApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FasalApi {
    FasalApi({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });

    int id;
    String title;
    int price;
    String description;
    List<String> images;
    DateTime creationAt;
    DateTime updatedAt;
    Category category;

    factory FasalApi.fromJson(Map<String, dynamic> json) => FasalApi(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
