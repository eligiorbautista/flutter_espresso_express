import "order.dart";
import 'package:flutter/material.dart';
import "products.dart";
import "contact.dart";

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainRootPage(),
    );
  }
}

class MainRootPage extends StatefulWidget {
  const MainRootPage({super.key});

  @override
  State<MainRootPage> createState() => _MainRootPageState();
}

class _MainRootPageState extends State<MainRootPage> {
  List<Widget> screenList = const [ProductsPage(), OrderPage(), ContactPage()];
  int currentIndexScreen = 0;

  aboutTheApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("About"),
            content: const SingleChildScrollView(
                child: Flexible(
              child: Text(
                """Welcome to ExpressoExpress!

We are thrilled to serve you delicious and tasty coffee with warm and inviting atmosphere. Our main goal is to create space for people to connect and relax and also enjoy a great cup of coffee.

We believe that great coffee starts with high-quality beans and expert brewing techniques. That's why we source our coffee from the best roasters and take care to brew it to perfection every time. Whether you prefer a classic latte or a bold espresso, we've got you covered.""",
                textAlign: TextAlign.justify,
              ),
            )),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 174, 91, 8)),
                  child: const Text("Done"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 52, 47),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(18),
          child: Image.asset(
            "assets/icons/logo-no-background.png",
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
            onPressed: () {
              setState(() {
                aboutTheApp(context);
              });
            },
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
