import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_days/models/cart.dart';
import 'package:flutter_days/models/catlog.dart';

class MyStore extends VxStore {
  late CatlogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatlogModel();
    cart = CartModel();
    cart.catlog = catalog;
  }
}
