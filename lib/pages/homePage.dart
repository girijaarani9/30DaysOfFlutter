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
      appBar: AppBar(
        title: Text('Catlog App'),
      ),
      body: (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemCount: CatlogModel.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = CatlogModel.items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                    child: Image.network(item.imageUrl),
                    header: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.deepPurple,
                      child: Text(
                        item.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    footer: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
