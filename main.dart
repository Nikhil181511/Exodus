import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'dart:async'; // For using Timer

class TourPage extends StatefulWidget {
  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  // PageController for controlling the slideshow
  PageController _pageController = PageController();
  
  // Function to launch the URL
  Future<void> _launchURL() async {
    const url = 'https://goacabservices.com/';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri); // Opens the URL in the default browser
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    // Timer to change images every 3 seconds
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0; // Loop back to the first image
        }
        _pageController.animateToPage(nextPage, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Image Slideshow
          Container(
            height: 250,
            child: PageView(
              controller: _pageController,
              children: [
                Image.asset('assets/image1.jpg', fit: BoxFit.cover),
                Image.asset('assets/image2.jpg', fit: BoxFit.cover),
                Image.asset('assets/image3.jpg', fit: BoxFit.cover),
              ],
            ),
          ),

          // Details Container
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tour Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore the beautiful landscapes and tourist spots in this amazing tour. Our experienced guides will ensure a memorable experience.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          // Book a Tour Button
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _launchURL,
              child: Text('Book a Tour'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure plugins are initialized
  runApp(MaterialApp(
    home: TourPage(),
  ));
}
