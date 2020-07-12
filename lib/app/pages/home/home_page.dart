import 'package:coffee_shop_challenge/app/pages/home/components/app_bar.dart';
import 'package:coffee_shop_challenge/app/pages/home/components/bottom_bar.dart';
import 'package:coffee_shop_challenge/app/pages/home/home_controller.dart';
import 'package:coffee_shop_challenge/app/shared/custom/custom_theme.dart';
import 'package:coffee_shop_challenge/app/shared/products_json.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final produtos = ProductsJson();

  final List<String> bottomBarItems = [
    "Recipes",
    "Shipping",
    "Subscription",
    "Payments"
  ];

  @override
  void initState() {
    super.initState();

    produtos.productsResult();
  }

  @override
  Widget build(BuildContext context) {
    final counterController = Provider.of<HomeController>(context);
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColors.backgroundBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(appColors: appColors),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: produtos.productList.product.length,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: 500,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: appColors.lightOrange),
                  child: Stack(
                    overflow: Overflow.clip,
                    children: [
                      Positioned(
                        top: 20,
                        right: 10,
                        left: 10,
                        child: Image.asset(
                          produtos.productList.product[index].image,
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 270,
                          width: 320,
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
                                  produtos.productList.product[index].title,
                                  style: TextStyle(
                                      fontSize: 24, color: appColors.brown),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    produtos.productList.product[index].type,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appColors.lightBrown),
                                  ),
                                ),
                                Spacer(flex: 1),
                                Text(
                                  produtos
                                      .productList.product[index].description,
                                  style: TextStyle(color: Color(0xff4c4c4c)),
                                ),
                                Spacer(flex: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "R\$" +
                                          produtos
                                              .productList.product[index].price
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 20, color: appColors.brown),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: appColors.orange,
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
              ),
            ),
            Container(
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
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(appColors.white),
                    minHeight: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        bottomBarItems: bottomBarItems,
        appColors: appColors,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: produtos.productsResult,
        tooltip: 'Increment',
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
