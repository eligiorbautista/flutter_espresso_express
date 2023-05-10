import 'package:flutter/material.dart';
import 'main_navigation.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 36, 27),
      appBar: null,
      body: mainPage(),
    );
  }

  Widget mainPage() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 10,
                    color: const Color.fromARGB(255, 152, 77, 7),
                    child: Image.asset(
                      'assets/logo-color-rect.png',
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainNavigation()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                      backgroundColor: Color.fromARGB(255, 123, 77, 34),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "Let's get started",
                      style: TextStyle(fontSize: 18),
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ]),
          ]),
    );
  }
}
