class ProductsList {
  final List<ProductModel> product;

  ProductsList({this.product});

  factory ProductsList.fromJson(List<dynamic> parsedJson) {
    List<ProductModel> productModel = new List<ProductModel>();
    productModel = parsedJson.map((i) => ProductModel.fromJson(i)).toList();

    return ProductsList(
      product: productModel,
    );
  }
}

class ProductModel {
  String title;
  String type;
  String description;
  String image;
  int price;

  ProductModel(
      {this.title, this.type, this.description, this.image, this.price});

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
      title: json['title'],
      type: json['type'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
