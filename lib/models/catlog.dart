class CatlogModel {
  static List<Item> items = [];
}

class Item {
  final int id;
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

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        price: map["price"],
        desc: map["desc"],
        imageUrl: map["image"]);
  }
  toMap() =>
      {"id": id, "name": name, "price": price, "desc": desc, "image": imageUrl};
}
