class IceCream {
  final String flavor;
  final String description;
  final List<String> topping;
  final String price;
  final String image;
  final List<Map<String, String>> ingredients;

  IceCream({
    required this.flavor,
    required this.description,
    required this.topping,
    required this.price,
    required this.image,
    required this.ingredients,
  });
}
