import 'package:flutter/material.dart';
import 'pages/welcome.dart';

void main() {
  runApp(const EspressoExpress());
}

class EspressoExpress extends StatelessWidget {
  const EspressoExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
