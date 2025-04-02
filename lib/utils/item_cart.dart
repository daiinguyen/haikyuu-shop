import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:haikyuushop/utils/cart.dart';
import 'package:haikyuushop/utils/item.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatefulWidget {
  final Item item;
  const ItemCart({super.key, required this.item});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  void removeItem() {
    Provider.of<Cart>(context, listen: false).removeToCart(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 020),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(widget.item.itemImage),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 5),
                Text(
                  widget.item.itemName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(widget.item.itemRate),
                Text(
                  widget.item.itemPrice,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: 5),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: removeItem, icon: Icon(Icons.close)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: 70,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('-'),
                      Text(widget.item.itemCount.toString()),
                      Text('+'),
                    ],
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
