import 'package:flutter/material.dart';
import 'package:haikyuushop/utils/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final void Function()? onTap;

  const ItemTile({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 50),
      child: Container(
        padding: EdgeInsets.all(0),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.deepOrangeAccent, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                255,
                255,
                255,
                255,
              ).withAlpha((0.2 * 255).toInt()),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(item.itemImage),
                  ),
                ),
              ],
            ),
            Text(
              'Anime Keychains – Haikyuu ${item.itemName} Keyring Official Merch',
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(item.itemRate),
                      Text(
                        item.itemPrice,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Icon(Icons.add_shopping_cart_outlined),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
