// To parse this JSON data, do
//
//     final iceCream = iceCreamFromJson(jsonString);

import 'dart:convert';

IceCream iceCreamFromJson(String str) => IceCream.fromJson(json.decode(str));

String iceCreamToJson(IceCream data) => json.encode(data.toJson());

class IceCream {
  List<Icecream> icecreams;

  IceCream({
    required this.icecreams,
  });

  factory IceCream.fromJson(Map<String, dynamic> json) => IceCream(
        icecreams: List<Icecream>.from(
            json["icecreams"].map((x) => Icecream.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "icecreams": List<dynamic>.from(icecreams.map((x) => x.toJson())),
      };
}

class Icecream {
  String flavor;
  String description;
  List<String> topping;
  String price;
  String image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    required this.description,
    required this.topping,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) => Icecream(
        flavor: json["flavor"],
        description: json["description"],
        topping: List<String>.from(json["topping"].map((x) => x)),
        price: json["price"],
        image: json["image"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flavor": flavor,
        "description": description,
        "topping": List<dynamic>.from(topping.map((x) => x)),
        "price": price,
        "image": image,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
