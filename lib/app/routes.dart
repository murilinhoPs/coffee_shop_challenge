import 'package:flutter/material.dart';

import 'pages/cart/cart_page.dart';
import 'pages/details/details_page.dart';
import 'pages/home/home_page.dart';

class Routes {
  Route<dynamic> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case '/details':
        return MaterialPageRoute(
          builder: (context) => DetailsPage(
            productDetails: settings.arguments,
          ),
        );
      case '/cart':
        return MaterialPageRoute(builder: (context) => CartPage());
      default:
        return MaterialPageRoute(builder: (context) => MyHomePage());
    }
  }
}
