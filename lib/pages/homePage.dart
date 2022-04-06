import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:flutter_days/widgets/item_Widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catlogJson = await rootBundle.loadString("assets/files/products.json");
    var decodedData = jsonDecode(catlogJson);
    var productsData = decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catlog App'),
      ),
      body: ListView.builder(
        itemCount: CatlogModel.items.length,
        itemBuilder: (Context, int index) {
          return ItemWidget(
            item: CatlogModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
