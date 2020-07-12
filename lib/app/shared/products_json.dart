import 'package:coffee_shop_challenge/app/shared/models/product_model.dart';

class ProductsJson {
  ProductsList productList;

  productsResult() {
    productList = ProductsList.fromJson(productsJson);

    //producstJson.toList();

    print(productList);

    return productList;
  }

  final productsJson = [
    {
      "title": "Triple Shot Cold Brew Coffee",
      "type": "Coffe with AlmondMilk",
      "description":
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
      "image": "assets/product5.png",
      "price": 10.0,
    },
    {
      "title": "Jameson Cold Brew Whiskey and Coffee",
      "type": "Whiskey and Coffee",
      "description":
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
      "image": "assets/product2.png",
      "price": 14.0,
    },
  ];
}
