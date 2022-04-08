// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:flutter_days/widgets/item_Widget.dart';
import 'package:flutter_days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catlogJson =
        await rootBundle.loadString('assets/files/products.json');
    final decodedData = jsonDecode(catlogJson);
    var productsData = decodedData["products"];

    CatlogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.cream,
        body: SafeArea(
          child: Container(
            padding: Vx.m20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatlogHeader(),
                if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                  CatlogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App".text.xl5.color(MyTheme.blue).bold.make(),
        "Trending Products".text.xl2.color(MyTheme.grey).make()
      ],
    );
  }
}

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items[index];
        return CatlogItem(catalog: catalog);
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
        CatlogImage(
          image: catalog.imageUrl,
        ).p12(),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.xl.color(MyTheme.black).make(),
            catalog.desc.text.color(MyTheme.grey).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                //  crossAxisAlignment: CrossAxisAlignment.end,

                "\$${catalog.price}".text.bold.xl.color(MyTheme.blue).make(),
                Container(
                    width: 60,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.blue),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text("Buy"),
                    )),
              ],
            )
          ],
        ))
      ],
    )).white.square(100).roundedLg.make().py16();
  }
}

class CatlogImage extends StatelessWidget {
  final String image;
  const CatlogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, child: Image.network(image))
        .p12();
  }
}
