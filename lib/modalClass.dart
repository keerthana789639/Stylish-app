// class Products {
//   final String id;
//   final String name;

//   final String description;
//   final String image;
//   final String price;
//   final String originalprice;
//   final String discount;
//   final String size;
//   final String selectedSize;
//   final String rating;
//   final String reviewsCount;

//   Products({
//     required this.id,
//     required this.name,

//     required this.description,
//     required this.image,

//     required this.price,

//     required this.originalprice,

//     required this.discount,

//     required this.size,

//     required this.selectedSize,

//     required this.rating,
//     required this.reviewsCount,
//   });

//   factory Products.fromJson(Map<String, dynamic> json) {
//     return Products(
//       id: json["_id"],
//       name: json["name"],

//       description: json["description"],
//       image: json["image"],
//       price: json["price"],
//       originalprice: json["originalprice"],
//       discount: json["discount"],
//       size: json["size"],
//       selectedSize: json["selectedsize"],
//       rating: json["rating"],
//       reviewsCount: json["reviewsCount"]






//     );
//   }
// }

      


class Product {
  final String id;
  final String name;
  final String hashtag;
  final String category;
  final String description;
  final String image;
  final dynamic originalPrice;
  final String discount;
  final List<String> sizes;
  final String productDetails;
  final dynamic rating;
  final dynamic reviewsCount;
  

  Product({
    required this.id,
    required this.name,
    required this.hashtag,
    required this.category,

    required this.description,
    required this.image,
    required this.originalPrice,
    required this.discount,
    required this.sizes,
    required this.productDetails,
    required this.rating,
    required this.reviewsCount,
  
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      hashtag: json['hashtag'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      originalPrice: json['originalPrice'] ?? 0,
      discount: json['discount'] ?? '',
      sizes: List<String>.from(json['sizes'] ?? [""]),
      productDetails: json["productDetails"]??"",
      rating: json['rating'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
     
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'hashtag': hashtag,
        'category': category,
        'description': description,
        'image': image,
        'originalPrice': originalPrice,
        'discount': discount,
        'sizes': sizes,
        'rating': rating,
        'reviewsCount': reviewsCount,
      
      };
}