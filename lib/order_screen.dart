import "package:espresso_express/contact_screen.dart";
import "package:flutter/material.dart";

List<String> product = [
  "Espresso | ₱69",
  "Americano | ₱79",
  "Cafe latte | ₱89",
  "Cafe Mocha | ₱99",
  "Cappucino | ₱99",
  "Caramel Machiato | ₱109",
  "Pure Matcha | ₱129",
  "Citrus | ₱119",
  "Earl Grey | ₱89",
  "Paper Mint | ₱99",
  "Lemon Cheese Cake | ₱139",
  "Choco Chip Cookies | ₱129",
  "Fudge Brownies | ₱109",
  "Blueberry Muffin | ₱149"
];
final orderQtyController = TextEditingController();

String productValue = product.first;

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 237, 205, 159),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Select your order/s",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Select Product:",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: productValue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      productValue = newValue!;
                                    });
                                  },
                                  items: product.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Enter quantity:",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: orderQtyController,
                              decoration: const InputDecoration(
                                  hintText: "Qty",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 174, 91, 8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add_circle_rounded),
                                    Text(" Add to order"),
                                  ],
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Enter payment amount:",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: orderQtyController,
                              decoration: const InputDecoration(
                                  hintText: "Payment Amount",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 174, 91, 8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.payments_rounded),
                                  Text(" Complete Order & Pay"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
