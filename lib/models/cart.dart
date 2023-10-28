import 'package:my_shop/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;
// collection of ids store ids of each item
  final List<int> _itemids = [];

// Get catalog
  CatalogModel get catalog => _catalog;

//set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// get items in the cart
  List<Item> get items =>
      _itemids.map((id) => CatalogModel.getById(id)).toList();

// Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// Add Item
  void add(Item item) {
    _itemids.add(item.id);
  }

// Remove Item
  // void remove(Item item) {
  //   _itemids.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemids.remove(item.id);
  }
}
