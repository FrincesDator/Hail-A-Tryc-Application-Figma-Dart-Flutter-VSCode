import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  _RideHistoryPageState createState() => _RideHistoryPageState();
}

class _RideHistoryPageState extends State<RideHistoryPage> {
  List<Map<String, dynamic>> bookings = []; // Initialize bookings list

  @override
  void initState() {
    super.initState();
    fetchBookings(); // Correct method name
  }

  void fetchBookings() async { // Correct method name
    final response =
        await Supabase.instance.client.from('bookings').select().execute();
    if (response.error != null) {
      print('Error fetching bookings: ${response.error!.message}');
      return;
    }
    final List<dynamic>? data = response.data;
    if (data != null) {
      setState(() {
        bookings = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ride History',
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
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Current Location')),
            DataColumn(label: Text('Destination')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('Fare')),
          ],
          rows: bookings.map((booking) { // Correct variable name
            return DataRow(cells: [
              DataCell(Text(booking['current_location'])), // Correct variable name
              DataCell(Text(booking['destination'])), // Correct variable name
              DataCell(Text(booking['date'].toString())), // Correct variable name
              DataCell(Text(booking['time'].toString())), // Correct variable name
              DataCell(Text('\₱${booking['estimated_fare']}')), // Correct variable name
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
