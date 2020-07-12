import 'package:coffee_shop_challenge/app/shared/models/product_model.dart';

class ProductsJsonRepository {
  ProductsList productList;

  ProductsList productsResult() {
    productList = ProductsList.fromJson(productsJson);

    // if (filter)
    //   productList.product.sort((a, b) => Comparable.compare(a.price, b.price));

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
    {
      "title": "Jagermeifer Cold Brew Coffee",
      "type": "Coffeee",
      "description":
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
      "image": "assets/product4.png",
      "price": 8.0,
    },
    {
      "title": "Green Up Choco Protein",
      "type": "Cold Brew Coffee",
      "description":
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
      "image": "assets/product3.png",
      "price": 17.0,
    },
    {
      "title": "Grady`s Cold Brew French Vanilla",
      "type": "Coffee Concentrate",
      "description":
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
      "image": "assets/product1.png",
      "price": 13.0,
    },
  ];
}
