import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'securelogin.dart';
import 'thirdpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'funkyfoto',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginPage(),
      routes: {
        '/secureLogin': (context) => SecureLoginPage(),
        '/secureLoginPage': (context) => SecureLoginPage(),
        '/thirdPage': (context) => ThirdPage(),
        '/fifthPage': (context) => FifthPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _validUsername = 'unidreamerzz@gmail.com';
  final String _validPassword = 'jackey';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == _validUsername && password == _validPassword) {
      Navigator.pushNamed(context, '/secureLogin');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Credentials'),
            content: Text('Please enter a valid username and password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('funkyfoto'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/login_avatar.jpg'),
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.person, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecureLoginPage()),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Open chat screen
                // Add the logic to navigate to the chat screen
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Open notifications screen
                // Add the logic to navigate to the notifications screen
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/page5_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage('assets/images/profile_picture.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Adithya Anil',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Software Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.email, color: Colors.white),
                title: Text(
                  'unidreamerzz@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text(
                  '+91 8921959626',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.white),
                title: Text(
                  'Kerala, India',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/gif_image.gif',
                width: 200,
                height: 200,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('Edit Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
