import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Toxica ShravanDAA'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/shravan.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom:
                56.0, // Adjust the value based on the height of the BottomNavigationBar
            width: MediaQuery.of(context).size.width *
                0.4, // Adjust the width as needed
            child: Container(
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poem on Toxic Friends',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'In the darkest corners of our lives, toxic friends reside. They disguise themselves with pretty lies, their friendship we often confide. But beneath their smiling faces, toxicity resides. They drain our energy, leaving empty spaces, and cast shadows on our tides. Toxic friends sow seeds of doubt, like poison in our minds. They plant thorns along our route, leaving scars that never unwind. Yet, we hold on to their false charm, hoping for a change. But toxic friends only bring harm, their friendship feels so strange. So let us break free from their grip, reclaim our strength anew. For toxic friends, we must unzip, and bid them a final adieu.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xfff8f6f6),
        backgroundColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/thirdPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/fifthPage');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/secureLoginPage');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/secureLogin');
          // Or replace '/secureLogin' with '/secondPage' to navigate to the SecondPage
        },
        child: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
