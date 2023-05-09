import "package:espresso_express/contact_screen.dart";
import "package:flutter/material.dart";

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

List<String> categories = [
  "Coffee",
  "Tea",
  "Dessert",
];

List<String> coffees = [
  "Espresso",
  "Americano",
  "Cafe latte",
  "Cafe Mocha",
  "Cappucino",
  "Caramel Machiato",
];
List<String> teas = [
  "Pure Matcha",
  "Citrus",
  "Earl Grey",
];
List<String> desserts = [
  "Lemon Cheese Cake",
  "Choco Chip Cookies",
  "Fudge Brownies",
  "Blueberry Muffin"
];
Map categoryMap = {
  "Coffee": coffees,
  "Tea": teas,
  "Dessert": desserts,
};

String categoriesValue = categories.first;
var selectedCategory = categoryMap[categoriesValue];

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
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Select Category",
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
                                  value: categoriesValue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  onChanged: (String? categoriesValue) {
                                    setState(() {
                                      categoriesValue = categoriesValue!;
                                    });
                                  },
                                  items: categories
                                      .map<DropdownMenuItem<String>>(
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
                              height: 10,
                            ),
                            // DecoratedBox(
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       border: Border.all(color: Colors.black)),
                            //   child: Padding(
                            //     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            //     child: DropdownButton(
                            //       isExpanded: true,
                            //       value: categoriesValue,
                            //       icon: const Icon(Icons.arrow_drop_down_sharp),
                            //       onChanged: (String? categoriesValue) {
                            //         setState(() {
                            //           categoriesValue = categoriesValue!;
                            //         });
                            //       },
                            //       items: selectedCategory
                            //           .map<DropdownMenuItem<String>>(
                            //               (String value) {
                            //         return DropdownMenuItem<String>(
                            //           value: value,
                            //           child: Text(value),
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: " *",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: " *",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                              minLines: 5,
                              maxLines: 5,
                            ),
                            const SizedBox(
                              height: 10,
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
