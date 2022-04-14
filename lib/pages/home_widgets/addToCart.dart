import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_days/pages/home_widgets/catlogList.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catlog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool InCart = _cart.items.contains(widget);
    return Container(
        width: 60,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            final _catalog = CatlogModel();
            _cart.catlog = _catalog;
            _cart.add(widget.catalog);
            if (!InCart) {
              InCart = InCart.toggle();
              setState(() {});
            }
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.focusColor),
              shape: MaterialStateProperty.all(StadiumBorder())),
          child: InCart ? Icon(Icons.done) : Icon(Icons.add),
        ));
  }
}
