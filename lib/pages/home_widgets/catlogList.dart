import 'package:flutter/material.dart';
import 'package:flutter_days/models/cart.dart';
import 'package:flutter_days/pages/homePageDetails.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catlog.dart';
import '../../widgets/themes.dart';
import 'addToCart.dart';
import 'catlogImage.dart';

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePageDetail(catalog: catalog)),
                ),
            child: CatlogItem(catalog: catalog));
      },
    );
  }
}

class CatlogItem extends StatelessWidget {
  final Item catalog;

  const CatlogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatlogImage(
            image: catalog.imageUrl,
          ).p12(),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.xl.color(context.accentColor).make(),
            catalog.desc.text.color(MyTheme.grey).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                //  crossAxisAlignment: CrossAxisAlignment.end,

                "\$${catalog.price}"
                    .text
                    .bold
                    .xl
                    .color(context.theme.accentColor)
                    .make(),
                AddToCart(catalog: catalog),
              ],
            )
          ],
        ))
      ],
    )).color(context.theme.cardColor).square(100).roundedLg.make().py16();
  }
}
