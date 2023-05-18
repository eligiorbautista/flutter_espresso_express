import "package:flutter/material.dart";
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Future sendAutomatedResponse(
      String name, String email, String message) async {
    String emailUser = "kape.espresso.express@gmail.com";
    String emailPassword = "dvgrroasdpynyapf";

    final smtpServer = gmail(emailUser, emailPassword);
    final emailMessage = Message()
      ..from = Address(emailUser, "EspressoExpress")
      ..recipients.add(email)
      ..ccRecipients.add(email)
      ..bccRecipients.add(Address(email))
      ..subject =
          "Your message was successfully sent to the management of EspressoExpress"
      ..text = ""
      ..html = """
<br>Hello, $name<br><br>
<br>Your message was successfully sent to the management of EspressoExpress, we will get back to you as soon as we can.<br><br>
- Automated Message from EspressoExpress Application<br><br>
Date & Time:
<br>${DateTime.now()}

""";

    await send(emailMessage, smtpServer);
  }

  Future sendEmailMessage(String name, String email, String message) async {
    String emailUser = "kape.espresso.express@gmail.com";
    String emailPassword = "dvgrroasdpynyapf";

    final smtpServer = gmail(emailUser, emailPassword);
    final emailMessage = Message()
      ..from = Address(emailUser, "EspressoExpress")
      ..recipients.add(emailUser)
      ..ccRecipients.add(emailUser)
      ..bccRecipients.add(emailUser)
      ..subject = "You have a new message from EspressoExpress Application"
      ..text = ""
      ..html = """
Name:
<br>$name<br><br>

Email:
<br>$email<br><br>

Message: 
<br>$message<br><br>

Date & Time:
<br>${DateTime.now()}

""";
    await send(emailMessage, smtpServer);
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final contactFormKey = GlobalKey<FormState>();

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
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "How is our service?",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "If you have question and concerns about the products and services we provide, we are glad to assist you.",
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
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
                          "Send us a message",
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
                        key: contactFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required";
                                }
                                return null;
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                  hintText: "Full name*",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required";
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: "Email address*",
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required";
                                }
                                return null;
                              },
                              controller: messageController,
                              decoration: const InputDecoration(
                                  hintText: "Message*",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 38, 36, 27),
                                  )),
                                  filled: true),
                              minLines: 4,
                              maxLines: 4,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (contactFormKey.currentState!
                                        .validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Color.fromARGB(
                                                  247, 232, 178, 52),
                                              content: Text(
                                                "We appreciate your message and will get back to you as soon as we can.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              )));
                                      sendEmailMessage(
                                          nameController.text,
                                          emailController.text,
                                          messageController.text);
                                      sendAutomatedResponse(
                                          nameController.text,
                                          emailController.text,
                                          messageController.text);
                                    }
                                    nameController.clear();
                                    emailController.clear();
                                    messageController.clear();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 174, 91, 8)),
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              color: Color.fromARGB(255, 237, 205, 159),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Contact Information",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.location_on),
                        Text(
                          "  Lucena, Quezon Province, Philippines",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.phone),
                        Text(
                          " +6391234567891",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.mail),
                        Text(
                          "  kape.espresso.express@gmail.com",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
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
    );
  }
}
