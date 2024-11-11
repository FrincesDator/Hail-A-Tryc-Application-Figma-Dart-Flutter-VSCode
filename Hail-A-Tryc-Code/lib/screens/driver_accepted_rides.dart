import 'package:flutter/material.dart'; 
 
class DriverAcceptedRidesPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
        title: Text(
          'Accepted Rides',
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
        child: Padding( 
          padding: const EdgeInsets.all(16.0), 
          child: DataTable( 
            columns: [ 
              DataColumn(label: Text('Date and Time', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              DataColumn(label: Text('Type of Ride', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              DataColumn(label: Text('From', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              DataColumn(label: Text('To', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              DataColumn(label: Text('Amount', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              DataColumn(label: Text('Rider Name', style: TextStyle(fontFamily: 'AbrilFatface'))), 
 
            ], 
            rows: [ 
              DataRow(cells: [ 
                DataCell(Text('2024-05-01 14:30', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Pasakay', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Location A', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Location B', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('\$20.00', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('John Doe', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              ]), 
              DataRow(cells: [ 
                DataCell(Text('2024-05-03 09:15', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Padala', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Location C', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Location D', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('\$15.50', style: TextStyle(fontFamily: 'AbrilFatface'))), 
                DataCell(Text('Jane Smith', style: TextStyle(fontFamily: 'AbrilFatface'))), 
              ]), 
              // Add more rows as needed 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 

 