import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginPage(),
      routes: {
        '/secureLogin': (context) => SecureLoginPage(),
        '/thirdPage': (context) => ThirdPage(),
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
        title: Text('Login Here'),
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
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecureLoginPage extends StatefulWidget {
  @override
  _SecureLoginPageState createState() => _SecureLoginPageState();
}

class _SecureLoginPageState extends State<SecureLoginPage> {
  int _currentIndex = 0;

  final List<String> backgroundImageUrls = [
    'assets/images/gopal.jpg',
    'assets/images/adhi.jpg',
    'assets/images/Rahul vazha.jpg',
    'assets/images/rachana.jpg',
    'assets/images/devi.jpg',
    'assets/images/poppu.jpg',
    // Add more image URLs for each page
  ];

  final List<String> animalNames = [
    'Gopal',
    'Adhi',
    'RN Vazha',
    'Rachana',
    'Devi',
    'Poppu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo.shade800,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 280.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: List.generate(backgroundImageUrls.length, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backgroundImageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Text(
                              animalNames[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              'Page ${_currentIndex + 1} of ${backgroundImageUrls.length}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/thirdPage');
          }
        },
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Toxica ShravanDAA'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://lh3.googleusercontent.com/tYJYnt5jlOf073t7GVVXrJ4iAH6Gt6ZPRlfME1dbK_MxCXxTO6RtyW17fJkhPpGdPCKfhk2lK_n5Odr9VoepljWPq-p8EhFiLlFM5nlDn-mtwDXwvKK1knZiEDpXIG_pdRPWe9GsGXsnBKEx7nEXcaMW9lowQ7BI-FrbWmSPK8IMoAetQYD4rRlW75l-cJjj8-flrF5jKDVQLgdRhfQ8Kt2wT4Eyv41jwXZkw3y76V6yASxQi3cOjCdb306Xnpt_IlE5P9wC3I1GgDeiFnbZrLjWNB7b0zzW23hmvsTswlHrGhCDm9hLmSTmYLno-lnXRmGiDE4bDGdFA8TFs3IH_d_XePWXGWjpMXS1k1XxBN0Nb5M-TjPrjkKl9H6mO82FT815y5qrvqai6_nfHfNuoFkazjmHdUCjrF8HSO6Cbnyadllm8X1Mx5uCpd3yY1DxAmfgy2xHLMQ56SyMqpF1d01136EykWakgR-a6IQTH-nx66o4NV57D7nqewnE-AbdFh5lGnkSdaEbmO8cFkG9tuaHtmaKkILpcsXmRksbrE3KOUIf4aHo-HvAZErxjuqq0FOwZdR6DQwPRue5KvotnMgY0MnuiR5M_YvRVMbSPesz45Q6mL67cXyIiFNoUP6VXBnIOCBNEXrluF0OQFFbvtBSD0z3MvV_nbSEDsbatq37gZvAayBmka268M9qS6FxSpzyDd5eIYFk_4yEeNHI6-eQhtAtGkCcI65nZNK0T5-zc0OrI2k3kpl_CYTdEFyRA54KojKvTOlezB1Lzsfg3bpW7ile2tgkfGYovazlNMUre88dEv-HzQcjrMQlsN-PRTrxPdKV6AbwQxnhFXNbhPea1Oemb2OSzavpShAUATHkcjlVorB2HlRJ5Ed8CmC9ZN6cqRYWXYY2ZbWOSoQKHAHDBu8NJCjAMPyuayvWe9uiezSl884Mo5vvj0_I4Vo0j2Ldp2SGjKswQOh18O1pX3CeIioPG3u42Wbmi5P1PKjsn22yCQ=w722-h962-s-no?authuser=0'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Welcome'),
                      content: Text('Welcome to the toxic world!'),
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
              },
              child: Text('Do you know where you are..click here😈✌️'),
            ),
          ),
        ),
      ),
    );
  }
}
