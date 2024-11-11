import 'package:flutter/material.dart';

class DriverFAQPage extends StatelessWidget {
  final List<Map<String, String>> faqItems = [
    {
      "question": "What is Hail-A-Tryc?",
      "answer":
          "HAIL-A-TRYC is an app that connects you with passengers who need tricycle rides. It helps you find customers easily and manage ride requests efficiently.",
    },
    {
      "question": "What is Pasakay?",
      "answer":
          "Pasakay allows you to pick up passengers who request rides to specific destinations, making it easier for you to get more customers.",
    },
    {
      "question": "What is Paarkila?",
      "answer":
          "Paarkila enables you to rent out your tricycle to customers for personal use over a specified period, giving you an additional income source.",
    },
    {
      "question": "What is Pabili?",
      "answer":
          "Pabili involves you purchasing goods, such as groceries or food, on behalf of customers and delivering them to their location, providing another way for you to earn money.",
    },
    {
      "question": "What is Padala?",
      "answer":
          "Padala offers delivery services where you can deliver documents, packages, or other items for customers within Lucena City.",
    },
    {
      "question": "How do I sign up as a driver?",
      "answer":
          "To sign up as a driver, download the \"Hail a Tryc\" app from the App Store or Google Play. Open the app, select \"Driver Sign-Up,\" and follow the prompts to complete your registration. You will need to provide your personal details, vehicle information, and necessary documents.",
    },
    {
      "question": "What documents are required to sign up?",
      "answer":
          "You will need the following documents to complete your registration:\n- Valid driver's license\n- Vehicle registration\n- Proof of insurance\n- Background check clearance (if required)",
    },
    {
      "question": "How do I receive ride requests?",
      "answer":
          "Open the app, go online, and you'll receive notifications for nearby ride requests. Accept the request to get customer details and start the ride.",
    },
    {
      "question": "Where can I find my earnings?",
      "answer":
          "You can view your earnings in the Hail-A-Tryc app. Go to the 'Earnings' section in the app menu to see your daily, weekly, and monthly earnings.",
    },
    {
      "question": "Where can I find my accepted rides?",
      "answer":
          "You can view your accepted rides in the Hail-A-Tryc app. Go to the 'My Rides' or 'Ride History' section in the app menu to see the list of rides you've accepted.",
    },
    {
      "question": "How do I navigate to a passenger's location?",
      "answer":
          "Once you accept a ride request, the app will provide you with the passenger’s location and the best route to get there using the integrated GPS navigation system.",
    },
    {
      "question": "What payment methods should I accept?",
      "answer":
          "Hail-A-Tryc app only accepts cash payments, so ensure you have enough change available for your passengers.",
    },
    {
      "question": "How is the fare calculated?",
      "answer":
          "Fares are calculated based on the distance, time, and type of service. The app provides an estimated fare before you confirm the ride.",
    },
    {
      "question": "Are there any additional fees I should be aware of?",
      "answer":
          "Yes, additional fees may apply to certain services. Always check the app for specific details regarding fees.",
    },
    {
      "question": "Why was my account banned?",
      "answer":
          "Your account can be banned for reasons such as violating the app's terms of service, receiving repeated complaints from passengers, or engaging in unsafe behavior. Follow all guidelines to avoid issues.",
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
