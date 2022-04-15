import 'package:flutter_days/core/store.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemIds.add(item.id);
  }
}
