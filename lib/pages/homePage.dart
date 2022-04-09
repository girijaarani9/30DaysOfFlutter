// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:flutter_days/utils/MyRoutes.dart';
import 'package:flutter_days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/drawer.dart';
import 'home_widgets/catlogHeader.dart';
import 'home_widgets/catlogList.dart';

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.black,
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cart),
          child: Icon(CupertinoIcons.cart),
        ),
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
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
