// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
  RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rate,
    required this.image,
    required this.video,
    required this.ingredents,
  });

  int? id;
  String title;
  String category;
  double rate;
  String image;
  String video;
  List<Ingredent> ingredents;

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> ingredients = json['ingredents'] is String
        ? jsonDecode(json['ingredents'])
        : json['ingredents'];
    return RecipeModel(
      id: json["id"],
      title: json["title"],
      category: json["category"],
      rate: json["rate"],
      image: json["image"],
      video: json["video"],
      ingredents: List<Ingredent>.from(
        ingredients.map(
          (x) => Ingredent.fromJson(x),
        ),
      ),
    );
  }

  factory RecipeModel.fromJsonString(Map<String, dynamic> json) {
    List<dynamic> ingredients = json['ingredents'] is String
        ? jsonDecode(json['ingredents'])
        : json['ingredents'];
    return RecipeModel(
      id: json["id"],
      title: json["title"],
      category: json["category"],
      rate: json["rate"],
      image: json["image"],
      video: json["video"],
      ingredents: [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "rate": rate,
        "image": image,
        "video": video,
        "ingredents": [],
        // "ingredents": List<dynamic>.from(ingredents.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonString() => {
        "id": id,
        "title": title,
        "category": category,
        "rate": rate,
        "image": image,
        "video": video,
        "ingredents": [],
      };
}

class Ingredent {
  Ingredent({
    required this.name,
    required this.quantity,
  });

  String name;
  String quantity;

  factory Ingredent.fromJson(Map<String, dynamic> json) => Ingredent(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
