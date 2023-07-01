import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SecureLoginPage extends StatefulWidget {
  @override
  _SecureLoginPageState createState() => _SecureLoginPageState();
}

class _SecureLoginPageState extends State<SecureLoginPage> {
  int _currentIndex = 0;
  List<int> _selectedReactionIndices = List<int>.filled(6, -1);

  final List<String> backgroundImagePaths = [
    'assets/images/gopal.jpg',
    'assets/images/adhi.jpg',
    'assets/images/Rahul vazha.jpg',
    'assets/images/rachana.jpg',
    'assets/images/devi.jpg',
    'assets/images/poppu.jpg',
    // Add more image paths for each page
  ];

  final List<String> animalNames = [
    'Gopal',
    'Adhi',
    'RN Vazha',
    'Rachana',
    'Devi',
    'Poppu',
  ];

  final List<String> dailyInspirations = [
    "Flutter, where imagination meets innovation, as a developer, I build digital wonders.",
    "Anime is the gateway to a magical world, where dreams come to life and inspire my soul.",
    "The rhythm of a music band resonates with my heart, creating melodies that echo through eternity.",
    "Poppins sweets and dedication intertwine, sprinkling sweetness into my work and life.",
    "Amidst chaos, I seek serenity, nurturing peace within, and spreading harmony to the world.",
    "As a nursing enthusiast, I embrace the art of care, touching lives with compassion and healing.",
    // Add more daily inspirations
  ];

  final List<IconData> emojiReactions = [
    Icons.thumb_up,
    Icons.thumb_down,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('funkyfoto'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page5_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: List.generate(backgroundImagePaths.length, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(backgroundImagePaths[index]),
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
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              _currentIndex < dailyInspirations.length
                  ? dailyInspirations[_currentIndex]
                  : '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _buildEmojiReactions(),
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
        unselectedItemColor: Color(0xfff8f6f6),
        backgroundColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/thirdPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/fifthPage');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/SecureLoginPage');
          }
        },
      ),
    );
  }

  Widget _buildEmojiReactions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(emojiReactions.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedReactionIndices[_currentIndex] = index;
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: _selectedReactionIndices[_currentIndex] == index
                      ? Colors.red
                      : Colors.transparent,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  emojiReactions[index],
                  color: _selectedReactionIndices[_currentIndex] == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.7),
                  size: 32,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
