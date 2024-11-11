import 'package:flutter/material.dart';
import 'provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:supabase_flutter/supabase_flutter.dart';

class PasakayForm extends StatefulWidget {
  @override
  _PasakayFormState createState() => _PasakayFormState();
}

class _PasakayFormState extends State<PasakayForm> {
  final List<String> locations = [
    'SM City Lucena',
    'Pacific Mall Lucena',
    'Manuel S. Enverga University Foundation',
    'Sacred Heart College',
    'Maryhill College',
    'Perez Park',
    'Quezon Provincial Capitol',
    'Lucena Cathedral',
    'Lucena Market',
    'Dalahican Beach',
    'Old Lucena City Hall',
    'Cafe Antigua',
    'Lucena Fresh Air Hotel',
    'Lucena Fish Port',
    'PNR Lucena Station',
  ];

  String? selectedLocation;
  String? selectedDestination;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  double? estimatedFare;
  List<Map<String, dynamic>> fareRates = []; // Declare fareRates here

  final supabase = Supabase.instance.client;
  String? name;
  String? contactNumber;

  @override
  void initState() {
    super.initState();
    fetchFareRates();
    fetchUserInfo();
  }

  void fetchFareRates() async {
    final response = await supabase.from('fares').select().execute();
    if (response.error != null) {
      print('Error fetching fare rates: ${response.error!.message}');
      return;
    }
    final List<dynamic>? data = response.data;
    if (data != null) {
      setState(() {
        fareRates = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  void fetchUserInfo() async {
    final userCredentials =
        provider.Provider.of<UserCredentials>(context, listen: false);
    final response = await supabase
        .from('users')
        .select('name, contact_number')
        .eq('username', userCredentials.username)
        .eq('password', userCredentials.password)
        .single()
        .execute();

    if (response.error != null) {
      print('Error fetching user info: ${response.error!.message}');
      return;
    }

    final data = response.data;
    setState(() {
      name = data['name'];
      contactNumber = data['contact_number'];
    });
  }

  void calculateEstimatedFare() {
    if (selectedLocation != null && selectedDestination != null) {
      final fareRate = fareRates.firstWhere(
        (rate) =>
            rate['location'] == selectedLocation &&
            rate['destination'] == selectedDestination,
        orElse: () => {'fare': 0}, // Provide a default value here
      );
      setState(() {
        estimatedFare = fareRate['fare'];
      });
    }
  }

  void storeBooking() async {
  if (name == null || contactNumber == null || selectedLocation == null || selectedDestination == null) {
    print('Error: Some required fields are null');
    return;
  }

  final response = await supabase.from('bookings').insert({
    'name': name!,
    'contact_number': contactNumber!,
    'current_location': selectedLocation!,
    'destination': selectedDestination!,
    'date': selectedDate.toIso8601String(),
    'time': '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
    'estimated_fare': estimatedFare,
  }).execute();

  if (response.error != null) {
    print('Error storing booking: ${response.error!.message}');
    print('Response data: ${response.data}');
    return;
  }

  if (response.data != null && response.data!.length > 0) {
    print('Booking stored successfully! Inserted ID: ${response.data![0]['id']}');
  } else {
    print('Unknown error: No data returned after insertion');
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pasakay Form',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFBF0D3E), width: 4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (name != null && contactNumber != null) ...[
                Text(
                  'Name: $name',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AbrilFatface',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Number: $contactNumber',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AbrilFatface',
                  ),
                ),
                SizedBox(height: 20),
              ],
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (picked != null && picked != selectedTime) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
                child: Text(
                  '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'AlikeAngular',
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Text(
                  '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'AlikeAngular',
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Current Location',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              DropdownButton<String>(
                value: selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                    calculateEstimatedFare();
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                          fontFamily: 'AlikeAngular',
                          fontSize: 15,
                        )),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Destination',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              DropdownButton<String>(
                value: selectedDestination,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDestination = newValue;
                    calculateEstimatedFare();
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                          fontFamily: 'AlikeAngular',
                          fontSize: 15,
                        )),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Estimated Fare',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              Text(
                estimatedFare != null
                    ? '\₱${estimatedFare!.toStringAsFixed(2)}'
                    : '\₱XX.XX',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'AlikeAngular',
                ),
              ),
              SizedBox(height: 20),
              Container(
                // Divider with color 0xFFFED141
                height: 1,
                color: Color(0xFFFED141),
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    storeBooking(); 
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF0032A0)),
                  ),
                  child: Text('BOOK',
                      style: TextStyle(
                        fontFamily: 'AbrilFatface',
                        color: Colors.white,
                        fontSize: 17,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
