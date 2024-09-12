class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json["title"],
        price: double.parse(json['price'].toString()),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromjson(json["rating"]));
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromjson(Map<String, dynamic> json) {
    return Rating(
        rate: double.parse(json['rate'].toString()),
        count: int.parse(json['count'].toString()));
  }
}
