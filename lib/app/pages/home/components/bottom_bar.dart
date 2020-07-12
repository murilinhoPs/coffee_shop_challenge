import 'package:coffee_shop_challenge/app/pages/home/home_controller.dart';
import 'package:coffee_shop_challenge/app/shared/custom/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  final AppColors appColors;
  final List<String> bottomBarItems;

  const BottomBar({Key key, this.appColors, this.bottomBarItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<HomeController>(context);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.025, horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.1,
      constraints: BoxConstraints.loose(Size.fromHeight(100)),
      foregroundDecoration: null,
      decoration: BoxDecoration(
        color: appColors.bottomBarBlue,
        border: Border(
          top: BorderSide(
              style: BorderStyle.solid, color: Colors.white54, width: 0.5),
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.horizontal,
        itemCount: bottomBarItems.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              productsController.filterListStates(bottomBarItems[index]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              bottomBarItems[index].toUpperCase(),
              overflow: TextOverflow.visible,
              style: TextStyle(color: appColors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
