import 'package:coffee_shop_challenge/app/shared/custom/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final AppColors appColors;

  const CustomAppBar({Key key, this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Products",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: appColors.beige),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: appColors.grey,
            ),
            child: Image.asset(
              "assets/cart_icon.png",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
