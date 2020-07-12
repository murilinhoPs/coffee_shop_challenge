import 'package:coffee_shop_challenge/app/pages/home/components/app_bar.dart';
import 'package:coffee_shop_challenge/app/pages/home/components/bottom_bar.dart';
import 'package:coffee_shop_challenge/app/shared/custom/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> bottomBarItems = ["title", "price", "type", "outro"];

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return MultiProvider(
      providers: [
        Provider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: Scaffold(
        backgroundColor: appColors.backgroundBlue,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: SafeArea(child: CustomAppBar(appColors: appColors)),
        ),
        body: Body(
          appColors: appColors,
        ),
        bottomNavigationBar: BottomBar(
          bottomBarItems: bottomBarItems,
          appColors: appColors,
        ),
      ),
    );
  }
}
