import "package:espresso_express/order_screen.dart";
import 'package:flutter/material.dart';
import "package:espresso_express/product_screen.dart";
import "package:espresso_express/contact_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const EspressoExpress());
}

class EspressoExpress extends StatelessWidget {
  const EspressoExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> screenList = const [
    ProductScreen(),
    OrderScreen(),
    ContactScreen()
  ];
  int currentIndexScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 36, 27),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(18),
          child: Image.asset(
            "assets/logo-no-background.png",
            width: 170,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              size: 20,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 38, 36, 27),
      ),
      body: screenList[currentIndexScreen],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 38, 36, 27),
          onTap: (int index) {
            setState(() {
              currentIndexScreen = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.coffee_rounded,
                size: 20,
              ),
              label: "Products",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                size: 20,
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.phone_rounded,
                  size: 20,
                ),
                label: "Contact")
          ],
          selectedItemColor: Color.fromARGB(255, 211, 143, 15),
          unselectedItemColor: Color.fromARGB(255, 144, 138, 138),
          currentIndex: currentIndexScreen),
    );
  }
}
