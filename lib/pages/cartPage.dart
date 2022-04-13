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
      body:
          Column(children: [CartList().p32().expand(), Divider(), cartTotal()]),
    );
  }
}

class cartTotal extends StatelessWidget {
  const cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$9999",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Buy"))
          ],
        ));
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
              onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
          title: Text("Items"),
        );
      },
    );
  }
}
