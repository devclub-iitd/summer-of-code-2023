import 'package:myproject/models/catalog.dart';
// ignore: unused_import
import 'package:myproject/core/store.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
  CatalogModel? _catalog;
final List<int> _itemIds = [];

CatalogModel get catalog {
  assert(_catalog != null, 'Catalog is not initialized.');
  return _catalog!;
}

set catalog(CatalogModel newCatalog) {
  // ignore: unnecessary_null_comparison
  assert(newCatalog != null, 'New catalog cannot be null.');
  _catalog = newCatalog;
}

List get items {
  assert(_catalog != null, 'Catalog is not initialized.');
  return _itemIds.map((id) => _catalog!.getById(id)).toList();
}

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}
  // ignore: non_constant_identifier_names
  class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
