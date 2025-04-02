import 'package:flutter/material.dart';
import 'package:haikyuushop/utils/cart.dart';
import 'package:haikyuushop/utils/item.dart';
import 'package:haikyuushop/utils/item_cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        if (value.itemCart.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Empty Cart!',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),

                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 4,
                  ),
                ),
                Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.grey.withOpacity(0.5),
                  size: 30,
                ),
              ],
            ),
          );
        }
        return Stack(
          alignment: AlignmentDirectional(1, 1),
          children: [
            ListView.builder(
              itemCount: value.getItemCart().length,
              itemBuilder: (context, index) {
                Item item = value.getItemCart()[index];
                return ItemCart(item: item);
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffD4145A), Color(0xffFBB03B)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pay Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.shopping_cart_checkout_outlined),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
