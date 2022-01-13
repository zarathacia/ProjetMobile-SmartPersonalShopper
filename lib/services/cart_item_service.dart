

import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/services/sql_service.dart';
import 'package:smart_personal_shopper/services/storage_service.dart';

class ItemServices {
  SQLService sqlService = SQLService();
  StorageService storageService = StorageService();
  List<CartItem> cartList = [];

  Future<List<CartItem>> getCartItems() async {
    final list= await getCartList();

    int count = 1;
    list.forEach((element) {
      element['id'] = count;
      cartList.add(CartItem.fromJson(element));
      count++;
    });
    return cartList;
  }

  Future<CartItem> getItem(String itemId) async {
    return await sqlService.getItem(itemId);
  }

  Future getCartList() async {
    return await sqlService.getCartList();
  }
  Future<List<CartItem>> get items => getCartItems();

  Future openDB() async {
    return await sqlService.openDB();
  }

  Future<bool> isFirstTime() async {
    return await storageService.getItem("isFirstTime") == 'true';
  }

  Future addToCart(CartItem data) async {
    print("service");
    return await sqlService.addToCart(data);
  }

  removeFromCart(String itemId) async {
    return await sqlService.removeFromCart(itemId);
  }
}
