

import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/services/cart_item_service.dart';

class CartController{
  ItemServices itemServices = ItemServices();
  List<CartItem> cartItems = [];
  bool isLoading = true;

  void onInit() {
    loadDB();
  }

  loadDB() async {
    await itemServices.openDB();
    getCardList();
  }


  getItem(String id) {
    if(cartItems.isNotEmpty) {
      return cartItems.singleWhere((element) => element.id == id);
    }
    return true;
  }

  bool isAlreadyInCart(String id) {
    return itemServices.getItem(id)!=null;
  }

  getCardList() async{
    try {
      List list = await itemServices.getCartList();
      cartItems.clear();
      print("*******************here");
      print(list.length);
      int count=1;
      list.forEach((element) {
        cartItems.add(CartItem.fromJson(element));
      });
    } catch (e) {
      print(e);
    }
  }

  Future addToCart(CartItem item) async {
    print("controller");
    isLoading = true;
    var result = await itemServices.addToCart(item);
    isLoading = false;
    return result;
  }

  removeFromCart(String id) async {
    itemServices.removeFromCart(id);
    int index = cartItems.indexWhere((element) => element.id == id);
    cartItems.removeAt(index);
  }
}