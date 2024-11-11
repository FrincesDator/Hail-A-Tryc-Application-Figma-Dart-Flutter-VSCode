import 'package:flutter/material.dart';
import 'driver_edit_profile.dart';
import 'driver_faqs.dart';
import 'driver_ride_history.dart';
import 'driver_accepted_rides.dart';
import 'driver_earnings.dart';

void _navigateToAcceptedRides(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DriverAcceptedRidesPage()),
  );
}

void _navigateToEarnings(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EarningsPage()),
  );
}

void _navigateToDriverHistory(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DriverRideHistoryPage()),
  );
}

void _navigateToFAQS(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DriverFAQPage()),
  );
}

void _navigateToEditProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DriverEditProfilePage()),
  );
}

class DriverHomePage extends StatelessWidget {
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
                          bottom: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2.5),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/LOGOBG.png',
                              width: 150,
                              height: 150,
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
                    // ACCEPTED RIDES CODE
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
                              Icons.check_box,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'ACCEPTED RIDES',
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
                                  _navigateToAcceptedRides(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // EARNINGS CODE
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
                              Icons.account_balance_wallet,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'EARNINGS',
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
                                  _navigateToEarnings(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // EDIT PROFILE CODE
                    SizedBox(height: 30),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBF0D3E),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'EDIT PROFILE',
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
                                  _navigateToEditProfile(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // FAQS CODE
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBF0D3E),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.help,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'FAQS',
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
                                  _navigateToFAQS(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // DRIVER HISTORY CODE
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBF0D3E),
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Icon(
                              Icons.history,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'DRIVER HISTORY',
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
                                  _navigateToDriverHistory(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
