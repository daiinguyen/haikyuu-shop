import 'package:flutter/material.dart';
import 'package:haikyuushop/pages/intro_page.dart';
import 'package:haikyuushop/utils/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Haikyuu Shop',

            theme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.dark(),
              primaryColor: Colors.deepOrangeAccent,
            ),
            home: IntroPage(),
          ),
    );
  }
}
