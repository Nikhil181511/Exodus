import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final PageController _pageController = PageController();

  Future<void> _launchURL() async {
    const url = 'https://en.wikipedia.org/wiki/Baga,_Goa';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('Images/baga.jpg', fit: BoxFit.cover),
                  Image.asset('Images/baga2.jpg', fit: BoxFit.cover),
                  Image.asset('Images/baga3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Baga Beach in North Goa is one of the most popular and energetic beaches in the state, drawing tourists with its lively atmosphere, vibrant nightlife, and wide range of activities. Known for its beautiful golden sands and refreshing Arabian Sea waters, Baga is a hub for adventure seekers and party enthusiasts alike.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' Water sports are a major attraction here, with jet skiing, parasailing, banana boat rides, and windsurfing offering thrilling experiences on the waves. Baga’s bustling vibe is matched by the colorful shacks and restaurants that line the beach, serving everything from fresh seafood to international cuisines.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'As the sun sets, Baga transforms, with many beachside bars and clubs coming alive, making it one of Goa\'s top spots for nightlife.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Beyond the beach itself, Baga’s location offers plenty for tourists to explore. It’s close to other famous spots like Calangute Beach and Anjuna, which are easily accessible for day trips. Tito’s Lane, a famous street just off Baga Beach, is lined with some of the best nightclubs and bars in Goa, including the iconic Tito’s and Mambo’s, where visitors can dance the night away. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Baga is also known for its shopping, with bustling markets and street stalls offering everything from beachwear and souvenirs to handmade jewelry.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'With its mix of natural beauty, adventurous activities, and lively entertainment options, Baga Beach provides an unforgettable experience for visitors looking to enjoy the best of Goa’s coastal excitement.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _launchURL,
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: Text('Book a Tour'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the quiz button press
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: Text('Play Quiz!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
