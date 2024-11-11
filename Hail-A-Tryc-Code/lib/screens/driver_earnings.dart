import 'package:flutter/material.dart'; 
 
class EarningsPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
        title: Text(
          'Earnings',
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
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
              Text( 
                'Total Earnings:', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'), 
              ), 
              SizedBox(height: 10), 
              Text( 
                '₱1234.56', // This would be dynamically loaded in a real app 
                style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'), 
              ), 
              SizedBox(height: 20), 
              Text( 
                'Detailed Earnings:', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'), 
              ), 
              ListView.builder( 
                physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling 
                shrinkWrap: true, // Use children's total length 
                itemCount: 5, // Example number of trips 
                itemBuilder: (context, index) { 
                  return Card( 
                    child: ListTile( 
                      title: Text('Trip ${index + 1}', style: TextStyle(fontFamily: 'AbrilFatface')), 
                      subtitle: Text('Date: 2024-05-${index + 1}', style: TextStyle(fontFamily: 'AbrilFatface')), 
                      trailing: Text( 
                        '₱${(20 + index * 5).toStringAsFixed(2)}', 
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'), 
                      ), 
                    ), 
                  ); 
                }, 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 

 