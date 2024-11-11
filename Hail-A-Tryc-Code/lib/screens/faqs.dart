import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqItems = [
    {
      "question": "What is Hail-A-Tryc?",
      "answer":
          "The HAIL-A-TRYC application that specifically caters to tricycle transportation serves as a specialized platform for users to book tricycle rides conveniently.",
    },
    {
      "question": "What is Pasakay?",
      "answer":
          "Pasakay involves passengers requesting rides to their desired destinations reducing the hassle of waiting for public transportation.",
    },
    {
      "question": "What is Paarkila?",
      "answer":
          "Paarkila allows customers to rent tricycles for personal use over a specified period.",
    },
    {
      "question": "What is Pabili?",
      "answer":
          "Pabili involves tricycle drivers purchasing goods on behalf of customers, such as groceries or food from local stores and delivering them to the customers' locations.",
    },
    {
      "question": "What is Padala?",
      "answer":
          "Padala offers delivery services using tricycles, allowing customers to entrust tricycle drivers with delivering documents, packages, or other items to specified locations within Lucena City.",
    },
    {
      "question": "How do I book a ride?",
      "answer":
          "Open the app, select the services, enter your pickup and drop-off locations, and confirm the booking. A nearby driver will be assigned to you.",
    },
    {
      "question": "What payment methods are accepted?",
      "answer": "Hail-A-Tryc app only accept cash payment.",
    },
    {
      "question": "How is the fare calculated?",
      "answer":
          "The fare is calculated based on the distance, time, and type of service selected. The app provides an estimated fare before confirming the booking.",
    },
    {
      "question": "Are there any additional fees?",
      "answer": "Additional fees may apply to all Hail-A-Tryc services.",
    },
    {
      "question": "Why was my account banned?",
      "answer":
          "Accounts can be banned for several reasons, including but not limited to, violating the app's terms of service, repeated complaints from drivers or passengers, or engaging in unsafe or inappropriate behavior.",
    },
    // Add more FAQItems as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            fontFamily: 'AbrilFatface',
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF0032A0),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Text(
                faqItems[index]['question'] ?? '',
                style: TextStyle(fontFamily: 'AbrilFatface', fontSize: 17.0),
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    faqItems[index]['answer'] ?? '',
                    style:
                        TextStyle(fontFamily: 'AlikeAngular', fontSize: 15.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
