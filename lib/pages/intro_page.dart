import 'package:flutter/material.dart';
import 'package:haikyuushop/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double systemWidth = MediaQuery.of(context).size.width;
    final double systemHeight = MediaQuery.of(context).size.height;
    void navigateToHomePage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0], // Tỷ lệ phân bố màu
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: systemHeight * 0.1),
              Column(
                children: [
                  Hero(
                    tag: 'logo',
                    child: Align(
                      alignment: Alignment(0, 0),
                      child: Image.asset(
                        'assets/images/pngegg.png',
                        width: systemWidth * 0.8,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        'Nothing is impossible, It\'s just difficult',
                        style: TextStyle(
                          fontFamily: 'haikyuu',
                          color: Colors.orange,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Nothing is impossible, It\'s just difficult',
                        style: TextStyle(
                          fontFamily: 'haikyuufill',
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: systemHeight * 0.055),
              TextButton(
                onPressed: navigateToHomePage,
                child: Text(
                  'PRESS TO START!',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: const [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: systemHeight * 0.015),
              Image.asset(
                'assets/images/fce466d8246d91ad7357f921b635b6df (1).png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
