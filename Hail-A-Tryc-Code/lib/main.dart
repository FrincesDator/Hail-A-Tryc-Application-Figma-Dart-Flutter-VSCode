import 'package:flutter/material.dart';
import 'screens/sign_up_page.dart';
import 'screens/home_page.dart';
import 'screens/driver_home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/provider.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jefulhlcoysfljcarixg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImplZnVsaGxjb3lzZmxqY2FyaXhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYwOTE5MTksImV4cCI6MjAzMTY2NzkxOX0.8Nhqy8N2G1Oi944LPE5EzghIHZEeN7IlVXvK2Te9Bag',
  );
  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<UserCredentials>(
          create: (_) => UserCredentials(),
        ),
        provider.Provider<SupabaseClient>(
          create: (_) => Supabase.instance.client,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HAIL-A-TRYC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          centerTitle: true, // Center the app bar title
          titleTextStyle: TextStyle(
            fontFamily: 'AbrilFatface',
            color: Colors.white,
            fontSize: 20, // Set the font size to 20
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Query Supabase to check if the user exists with the provided username and password
      final response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('username', _username)
          .single()
          .execute();

      if (response.error == null) {
        final user = response.data;
        if (user != null) {
          final passwordMatches = _password ==
              user[
                  'password']; // Simple comparison, ensure to hash and verify the password in production

          if (passwordMatches) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login successful!')),
            );
            provider.Provider.of<UserCredentials>(context,
                    listen: false) // Using the alias here
                .setCredentials(_username, _password);
            _navigateToHomePage();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid username or password')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User not found')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.error!.message)),
        );
      }
    }
  }

  void _navigateToSignUp() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpPage()),
  );
}

void _navigateToHomePage() async {
  final user = provider.Provider.of<UserCredentials>(context, listen: false);
  if (user.username?.startsWith('Driver') ?? false) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DriverHomePage()),
    );
    
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserHomePage()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HAIL-A-TRYC',
          style: TextStyle(
            fontFamily: 'AbrilFatface',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF0032A0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Color(0xFF0032A0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF0032A0), width: 2),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/LOGOBG.png'),
                            radius: 50,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'LOG IN',
                          style: TextStyle(
                            fontFamily: 'AbrilFatface',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0032A0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
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
                              SizedBox(height: 16),
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
                              ElevatedButton(
                                onPressed: _login,
                                child: Text('LOG IN',
                                    style: TextStyle(
                                      fontFamily: 'AbrilFatface',
                                      color: Colors.white,
                                      fontSize: 17,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0032A0),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: _navigateToSignUp,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF0032A0),
                                    fontFamily: 'AbrilFatface',
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
