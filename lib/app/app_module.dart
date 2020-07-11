import 'package:coffee_shop_challenge/app/app_widget.dart';
import 'package:coffee_shop_challenge/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeController>(
          create: (_) => HomeController(),
        )
      ],
      child: AppWidget(),
    );
  }
}
