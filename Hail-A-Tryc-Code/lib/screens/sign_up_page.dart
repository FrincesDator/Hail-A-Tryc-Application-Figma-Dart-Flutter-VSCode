import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _contactNumber = '';
  String _homeLocation = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {}); // Trigger rebuild of the widget

      // Trim whitespace from passwords
      _password = _password.trim();
      _confirmPassword = _confirmPassword.trim();

      if (_password == _confirmPassword) {
        // Passwords match
        print(
            'Name: $_name, Contact: $_contactNumber, Location: $_homeLocation, Username: $_username, Password: $_password');

        // Insert into Supabase
        final response = await supabase.from('users').insert({
          'name': _name,
          'contact_number': _contactNumber,
          'home_location': _homeLocation,
          'username': _username,
          'password': _password, // Store passwords securely in production
        }).execute();

        if (response.error == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign Up successful!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.error!.message}')),
          );
        }
      } else {
        // Passwords don't match
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Color(0xFFBF0D3E), width: 4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFF0032A0), width: 2),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('images/LOGOBG.png'),
                              radius: 50,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Sign Up Form',
                            style: TextStyle(
                              fontFamily: 'AbrilFatface',
                              fontSize: 24,
                              color: Color(0xFF0032A0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contact Number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your contact number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _contactNumber = value!;
                        },
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Home Location',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your home location';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _homeLocation = value!;
                        },
                      ),
                      SizedBox(height: 40),
                      Divider(color: Color(0xFFFED141), thickness: 2),
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value!;
                        },
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _signUp,
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontFamily: 'AbrilFatface',
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0032A0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
