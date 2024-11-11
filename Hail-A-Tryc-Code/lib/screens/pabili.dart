import 'package:flutter/material.dart';

class PabiliForm extends StatefulWidget {
  @override
  _PabiliFormState createState() => _PabiliFormState();
}

class _PabiliFormState extends State<PabiliForm> {
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
  String? listOfOrders;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pabili Form',
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
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'AlikeAngular',
                        fontSize: 15,
                      ),
                    ),
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
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'AlikeAngular',
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Stores',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    listOfOrders = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter Stores',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: 'AlikeAngular',
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'AlikeAngular',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'List of Orders',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    listOfOrders = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter List of Orders',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: 'AlikeAngular',
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'AlikeAngular',
                ),
                maxLines: 5,
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
                '\$XX.XX', // You can update this dynamically
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'AlikeAngular',
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 1,
                color: Color(0xFFFED141),
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Perform booking action
                    print('Booking confirmed!');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF0032A0)),
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontFamily: 'AbrilFatface',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
