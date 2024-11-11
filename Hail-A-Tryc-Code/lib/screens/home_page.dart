import 'package:flutter/material.dart';
import 'paarkila.dart';
import 'pabili.dart';
import 'padala.dart';
import 'pasakay.dart';
import 'ride_history.dart';
import 'faqs.dart';
import 'edit_profile.dart';

void _navigateToPaarkila(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PaarkilaForm()),
  );
}
void _navigateToPasakay(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PasakayForm()),
  );
}
void _navigateToPadala(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PadalaForm()),
  );
}

void _navigateToPabili(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PabiliForm()),
  );
}
void _navigateToRideHistory(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RideHistoryPage()),
  );
}

void _navigateToFAQS(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FAQPage()),
  );
}

void _navigateToEditProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditProfilePage()),
  );
}

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFFFED141),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFFED141),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0,
                            bottom: 10.0), // Adjust the padding value as needed
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2.5),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/LOGOBG.png', // Corrected the path
                              width: 150, // Adjust width as needed
                              height: 150, // Adjust height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.5),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      color: Colors.black,
                    ),
                    SizedBox(height: 30),
                    // PASAKAY CODE
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0032A0),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.hail,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'PASAKAY',
                              style: TextStyle(
                                fontFamily: "AbrilFatface",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                                iconSize: 30.0,
                                onPressed: () {
                                  _navigateToPasakay(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // PAARKILA CODE
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0032A0),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.family_restroom,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'PAARKILA',
                              style: TextStyle(
                                fontFamily: "AbrilFatface",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                                iconSize: 30.0,
                                onPressed: () {
                                  _navigateToPaarkila(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // PADALA CODE
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0032A0),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.shopping_bag,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'PADALA',
                              style: TextStyle(
                                fontFamily: "AbrilFatface",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                                iconSize: 30.0,
                                onPressed: () {
                                  _navigateToPadala(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // PABILI CODE
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0032A0),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.local_grocery_store,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'PABILI',
                              style: TextStyle(
                                fontFamily: "AbrilFatface",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                                iconSize: 30.0,
                                onPressed: () {
                                  _navigateToPabili(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: Container(
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFBF0D3E),
                                border:
                                Border.all(color: Colors.black, width: 2.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    iconSize: 40.0,
                                    
                                      onPressed: () {
                                  _navigateToEditProfile(context);
                                },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: Container(
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFBF0D3E),
                                border:
                                Border.all(color: Colors.black, width: 2.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.help,
                                      color: Colors.white,
                                    ),
                                    iconSize: 40.0,
                                    onPressed: () {
                                      _navigateToFAQS(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: Container(
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFBF0D3E),
                                border:
                                Border.all(color: Colors.black, width: 2.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.history,
                                      color: Colors.white,
                                    ),
                                    iconSize: 40.0,
                                    onPressed: () {
                                          _navigateToRideHistory(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
