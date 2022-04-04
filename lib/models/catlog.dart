import 'package:flutter/cupertino.dart';

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.imageUrl});
}

final products = [
  Item(
      id: "1",
      name: "Iphone11",
      desc: "Apple Iphone 11",
      price: 999,
      imageUrl:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-white-select-2019?wid=940&hei=1112&fmt=png-alpha&.v=1566956148115")
];
