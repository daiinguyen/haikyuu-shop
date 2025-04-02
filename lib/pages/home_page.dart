import 'package:flutter/material.dart';
import 'package:haikyuushop/pages/cart_page.dart';
import 'package:haikyuushop/pages/gg_nav_bar.dart';
import 'package:haikyuushop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Haikyuu Shop';
  int _selectedIndex = 0;
  late List<Widget> _pages; // Khai báo _pages là late

  void navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Khởi tạo _pages trong initState
    _pages = [
      const ShopPage(), // Truyền trực tiếp hàm
      const CartPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    title = _selectedIndex == 0 ? 'Haikyuu Shop' : 'My Cart';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'haikyuu',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Colors.deepOrangeAccent,
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(1, 0),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.06),
        ],
      ),
      bottomNavigationBar: GoogleNavBar(onTabChange: navigateBottonBar),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  'HAIKYUU',
                  style: TextStyle(
                    fontFamily: 'haikyuu',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Align(
                      alignment: Alignment(-0.2, 0),
                      child: Text(
                        'Home',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () => navigateBottonBar(0), // Chuyển về ShopPage
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Align(
                      alignment: Alignment(-0.2, 0),
                      child: Text(
                        'Settings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Align(
                  alignment: Alignment(-0.2, 0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
