import 'package:flutter/material.dart';
import 'package:haikyuushop/utils/cart.dart';
import 'package:haikyuushop/utils/item.dart';
import 'package:haikyuushop/utils/item_tile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addItemToCart(Item item, BuildContext context) {
    Provider.of<Cart>(context, listen: false).addToCart(item);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.5),
          titlePadding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          title: const Text(
            'Successfully Added!',
            style: TextStyle(color: Colors.white),
          ),
          actionsPadding: const EdgeInsets.all(10),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
              color: Colors.white,
            ),
          ],
          scrollable: true,
        );
      },
    ).then((_) {
      // Không cần Future.delayed, dialog sẽ đóng khi người dùng nhấn nút hoặc tự nhiên
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        final itemList = cart.getItemList();
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 2,
                      ),
                    ),
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Text(
                  'I just thought, it would be nice if we won with my pass!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      'Best Seller 🔥',
                      style: TextStyle(
                        fontFamily: 'haikyuu',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent,
                            blurRadius: 20,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 450,
                child:
                    itemList.isEmpty
                        ? const Center(child: Text('Không có sản phẩm nào'))
                        : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: itemList.length + 1,
                          itemBuilder: (context, index) {
                            if (index == itemList.length) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 150,
                                  left: 20,
                                  bottom: 230,
                                  right: 20,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                      color: Colors.deepOrangeAccent,
                                      width: 1.5,
                                    ),
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
                                  child: const Center(
                                    child: Text(
                                      'See More',
                                      style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            Item item = itemList[index];
                            return ItemTile(
                              item: item,
                              onTap: () => addItemToCart(item, context),
                            );
                          },
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}
