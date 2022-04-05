import 'package:flutter/material.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:flutter_days/widgets/item_Widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
