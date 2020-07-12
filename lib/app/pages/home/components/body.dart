import 'package:coffee_shop_challenge/app/pages/home/home_controller.dart';
import 'package:coffee_shop_challenge/app/shared/models/product_model.dart';
import 'package:coffee_shop_challenge/app/shared/repository/products_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../shared/custom/custom_theme.dart';

class Body extends StatefulWidget {
  final AppColors appColors;

  const Body({Key key, this.appColors}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final products = ProductsJsonRepository();

  @override
  void initState() {
    // Provider.of<HomeController>(context).getListFromRepository();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _productsList(),
        _productsListIndicator(),
      ],
    );
  }

  Widget _productsListIndicator() => Container(
        margin: EdgeInsets.only(left: 20),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1/5",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.25,
              valueColor: AlwaysStoppedAnimation<Color>(widget.appColors.white),
              minHeight: 2,
            ),
          ],
        ),
      );

  Widget _productsList() {
    final productsController = Provider.of<HomeController>(context);

    return Container(
      margin: EdgeInsets.only(top: 8.0),
      height: MediaQuery.of(context).size.height * 0.68,
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsController.productsList.product.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => _productCard(
              index: index, products: productsController.productsList),
        ),
      ),
    );
  }

  Widget _productCard({int index, ProductsList products}) => InkWell(
        splashColor: widget.appColors.lightBrown,
        onTap: () => Navigator.pushNamed(context, "/details",
            arguments: products.product[index]),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          width: 280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.appColors.lightOrange),
          child: Stack(
            overflow: Overflow.clip,
            children: [
              Positioned(
                top: 20,
                right: 10,
                left: 10,
                child: Image.asset(
                  products.product[index].image,
                  height: 200,
                  width: 200,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 270,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.product[index].title,
                          style: TextStyle(
                              fontSize: 24, color: widget.appColors.brown),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            products.product[index].type,
                            style: TextStyle(
                                fontSize: 20,
                                color: widget.appColors.lightBrown),
                          ),
                        ),
                        Spacer(flex: 1),
                        Text(
                          products.product[index].description,
                          style: TextStyle(color: Color(0xff4c4c4c)),
                        ),
                        Spacer(flex: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "R\$" + products.product[index].price.toString(),
                              style: TextStyle(
                                  fontSize: 20, color: widget.appColors.brown),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: widget.appColors.orange,
                              ),
                              child: Image.asset(
                                "assets/buy_icon.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
