import 'package:flutter/material.dart';
import 'package:flutter_days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: context.theme.accentColor),
        ),
      ),
    );
  }
}
