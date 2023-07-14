import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool isToxicPoemVisible = false;
  bool isToxicQuotesVisible = false;

  List<String> toxicQuotes = [
    '1.A toxic friend is like a parasite, draining your energy and happiness.',
    '2.Toxic friends are experts at manipulation, using your vulnerabilities against you.',
    '3.A true friend uplifts you, but a toxic friend brings you down.',
    '4.Toxic friends thrive on drama and chaos, leaving you emotionally exhausted.',
    '5.Don\'t let toxic friends poison your self-worth and confidence.'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showWelcomeDialog();
    });
  }

  void showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Welcome',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Welcome to the toxic world!',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'I am ready',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'La Toxica ShravanDAA',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff3a0abf),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ... existing code ...
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/shravan.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: AnimatedOpacity(
              opacity: isToxicPoemVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poem on Toxic Friends',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'In the darkest corners of our lives, toxic friends reside. They disguise themselves with pretty lies, their friendship we often confide. But beneath their smiling faces, toxicity resides. They drain our energy, leaving empty spaces, and cast shadows on our tides. Toxic friends sow seeds of doubt, like poison in our minds. They plant thorns along our route, leaving scars that never unwind. Yet, we hold on to their false charm, hoping for a change. But toxic friends only bring harm, their friendship feels so strange. So let us break free from their grip, reclaim our strength anew. For toxic friends, we must unzip, and bid them a final adieu.',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: isToxicQuotesVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Toxic Friendship Quotes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Column(
                      children: toxicQuotes.map((quote) {
                        return Text(
                          quote,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isToxicPoemVisible = !isToxicPoemVisible;
                      });
                    },
                    child: Text(
                      'Toxic Poem',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1239e5),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isToxicQuotesVisible = !isToxicQuotesVisible;
                      });
                    },
                    child: Text(
                      'Toxic Quotes',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1239e5),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
        selectedItemColor: Color(0xff16d273),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/thirdPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/fifthPage');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/secureLogin');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/secureLogin');
          // Or replace '/secureLogin' with '/secondPage' to navigate to the SecondPage
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Color(0xff16d273),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
