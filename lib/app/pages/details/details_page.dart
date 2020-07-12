import 'package:coffee_shop_challenge/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel productDetails;

  const DetailsPage({Key key, this.productDetails}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.productDetails.title),
    );
  }
}
