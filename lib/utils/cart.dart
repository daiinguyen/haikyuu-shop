import 'package:flutter/material.dart';
import 'package:haikyuushop/utils/item.dart';

class Cart extends ChangeNotifier {
  List<Item> shopitems = [
    Item(
      itemName: ' Hinata Shōyō',
      itemImage:
          'assets/images/shopitems/kf-S0803755bbe4340ef82faccbcb09c3d75L.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐⭐',
    ),
    Item(
      itemName: ' Kuroo Tetsurō',
      itemImage:
          'assets/images/shopitems/kf-S486e91a968464682af1444d40434fd03s.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐⭐',
    ),

    Item(
      itemName: ' Kageyama Tobio',
      itemImage:
          'assets/images/shopitems/kf-S0c2b71eb36f44c86a85fe871a73b25f0l.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
    Item(
      itemName: 'Sugawara Kōshi',
      itemImage:
          'assets/images/shopitems/kf-S2ee0a6bd60654246a780ac435c9f627az.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
    Item(
      itemName: 'Tsukishima Kei',
      itemImage:
          'assets/images/shopitems/kf-S4e2c854ac19949a5a0eb3991cd24b50fl.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
    Item(
      itemName: 'Kozume Kenma',
      itemImage:
          'assets/images/shopitems/kf-S6df657c787c840feb8817f919b5a89d7I.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
    Item(
      itemName: 'Sawamura Daichi',
      itemImage:
          'assets/images/shopitems/kf-S487b80bd394748fa948b0e8b954a46d4g.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
    Item(
      itemName: 'Michimiya Yui',
      itemImage:
          'assets/images/shopitems/kf-Sed27679938ef41fc87983d57edf005a5F.jpg_640x640.jpg_-small.webp',
      itemPrice: '\$ 9.99',
      itemRate: '⭐⭐⭐⭐',
    ),
  ];
  List<Item> itemCart = [];
  List<Item> getItemList() {
    return shopitems;
  }

  List<Item> getItemCart() {
    return itemCart;
  }

  void addToCart(Item item) {
    if (item.itemCount == 0) {
      itemCart.add(item);
      item.increaseCount();
    } else {
      item.increaseCount();
    }

    notifyListeners();
  }

  void removeToCart(Item item) {
    item.setItemCount = 0;
    itemCart.remove(item);
    notifyListeners();
  }
}
