import 'package:flutter_days/models/catlog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatlogModel _catlog;
  final List<int> _itemIds = [];

  CatlogModel get catlog => _catlog;

  set catlog(CatlogModel newCatalog) {
    _catlog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catlog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
