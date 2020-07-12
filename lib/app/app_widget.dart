import 'package:coffee_shop_challenge/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      initialRoute: "/",
      onGenerateRoute: Provider.of<Routes>(context).generatRoute,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
