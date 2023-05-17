import "package:flutter/material.dart";
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future sendEmailMessage(
      int tableNo, String orderList, double totalAmount) async {
    String emailUser = "kape.espresso.express@gmail.com";
    String emailPassword = "dvgrroasdpynyapf";

    final smtpServer = gmail(emailUser, emailPassword);
    final emailMessage = Message()
      ..from = Address(emailUser, "EspressoExpress New Order!")
      ..recipients.add(emailUser)
      ..ccRecipients.add(emailUser)
      ..bccRecipients.add(emailUser)
      ..subject = "Order from table no. $tableNo!"
      ..text = ""
      ..html = """
<b>TABLE NO:</b> $tableNo<br><br>

<b>ORDER LIST:</b>
<br>$orderList<br><br>

<b>TOTAL AMOUNT:</b> 
<br>₱$totalAmount<br><br>

<b>DATE & TIME:</b>
<br>${DateTime.now()}

""";
    await send(emailMessage, smtpServer);
  }

  final List<String> productList = [
    "Espresso",
    "Americano",
    "Cafe latte",
    "Cafe Mocha",
    "Cappucino",
    "Caramel Machiato",
    "Pure Matcha",
    "Citrus",
    "Earl Grey",
    "Paper Mint",
    "Lemon Cheese Cake",
    "Choco Chip Cookies",
    "Fudge Brownies",
    "Blueberry Muffin"
  ];

  final Map productPriceMap = {
    "Espresso": 69.0,
    "Americano": 79.0,
    "Cafe latte": 89.0,
    "Cafe Mocha": 99.0,
    "Cappucino": 99.0,
    "Caramel Machiato": 109.0,
    "Pure Matcha": 129.0,
    "Citrus": 119.0,
    "Earl Grey": 89.0,
    "Paper Mint": 99.0,
    "Lemon Cheese Cake": 139.0,
    "Choco Chip Cookies": 129.0,
    "Fudge Brownies": 109.0,
    "Blueberry Muffin": 149.0
  };

  List orderList = [];
  final orderFormKey = GlobalKey<FormState>();
  final tableNoController = TextEditingController();
  final qtyController = TextEditingController();
  final paymentController = TextEditingController();
  double totalAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    String productValue = productList.first;
    return StatefulBuilder(builder: (context, setState) {
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
                            "Order Form",
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
                          key: orderFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Enter Table no.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "*Required";
                                  }
                                  return null;
                                },
                                controller: tableNoController,
                                decoration: const InputDecoration(
                                    hintText: "Table no.",
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: productValue,
                                    icon:
                                        const Icon(Icons.arrow_drop_down_sharp),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        productValue = newValue!;
                                      });
                                    },
                                    items: productList
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
                              Row(
                                children: [
                                  Text(
                                    "Price: ₱${productPriceMap[productValue]} /each",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
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
                                controller: qtyController,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        if (qtyController.text != "" ||
                                            qtyController.text.isNotEmpty) {
                                          var productQty =
                                              "$productValue - ${qtyController.text}x - ₱${int.parse(qtyController.text) * productPriceMap[productValue]}";
                                          orderList.add(productQty);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "$productValue (${qtyController.text}x) has been added to your order.")));
                                          setState(() {
                                            totalAmount += (int.parse(
                                                    qtyController.text) *
                                                productPriceMap[productValue]);
                                            productValue = productList.first;
                                            qtyController.clear();
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 174, 91, 8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.add_circle_rounded),
                                          Text(" Add to order"),
                                        ],
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Your order/s:",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Card(
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black)),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      orderList.join("\n").toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (orderFormKey.currentState!
                                          .validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        247, 232, 178, 52),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 250,
                                                      ),
                                                      const Text(
                                                        "YOUR ORDER HAS BEEN PLACED",
                                                        style: TextStyle(
                                                            fontSize: 23,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Please wait for your order and prepare for your payment with the total amount of ₱$totalAmount",
                                                        style: const TextStyle(
                                                            fontSize: 21,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      const SizedBox(
                                                        height: 250,
                                                      ),
                                                    ],
                                                  ),
                                                )));
                                        setState(() {
                                          productValue = productList.first;
                                          qtyController.clear();
                                        });
                                        sendEmailMessage(
                                            int.parse(tableNoController.text),
                                            orderList.join("<br>").toString(),
                                            totalAmount);
                                        orderList.clear();
                                        totalAmount = 0.0;
                                        tableNoController.clear();
                                        paymentController.clear();
                                        qtyController.clear();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 174, 91, 8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.payments_rounded),
                                        Text(" Complete Order & Pay"),
                                      ],
                                    ),
                                  ),
                                ],
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
    });
  }
}
