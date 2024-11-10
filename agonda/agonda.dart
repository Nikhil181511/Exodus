import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class AgoPage extends StatefulWidget {
  @override
  _AgoPageState createState() => _AgoPageState();
}

class _AgoPageState extends State<AgoPage> {
  PageController _pageController = PageController();

  Future<void> _launchURL() async {
    const url = 'https://en.wikipedia.org/wiki/Agonda';
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
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
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
                  Image.asset('Images/agonda.jpg', fit: BoxFit.cover),
                  Image.asset('Images/agonda21.jpg', fit: BoxFit.cover),
                  Image.asset('Images/agonda31.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
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
                          'Agonda Beach in South Goa is a slice of paradise for those seeking a serene escape from the busier, tourist-filled spots. With its pristine stretch of golden sands, framed by lush palm trees and the gentle lapping of waves, Agonda is the ideal beach for relaxation and natural beauty. This unspoiled haven invites sunbathers, yoga enthusiasts, and peace-seekers to embrace its tranquil atmosphere. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The calm waters make it a safe and enjoyable spot for swimming, and as a protected nesting ground for olive ridley turtles, Agonda offers a rare chance to witness these incredible creatures during the nesting season—a unique experience that adds to the beach\'s charm.Whether you’re looking to lounge by the sea, explore the scenic surroundings, or simply unwind in nature, Agonda Beach promises a rejuvenating getaway.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Accommodation options here are charming and diverse, ranging from rustic beach huts to comfortable boutique hotels, all designed to blend seamlessly with the natural setting. Along the beach, you’ll find a selection of laid-back cafes and shacks offering delicious Goan dishes and international fare, making every meal an experience in itself.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The area is known for its relaxed vibe, and while it does attract tourists, it still maintains a quiet charm compared to more crowded parts of Goa. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Though Agonda doesn’t have the party scene of Goa’s northern beaches, the peaceful ambiance is a draw for those looking to disconnect and recharge. The beach’s location also makes it easy to explore nearby attractions like Butterfly Beach and Cabo De Rama Fort, both accessible within a short distance. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' Located just 40 minutes from Margao and about 70 km from Dabolim Airport, Agonda Beach offers an accessible yet secluded escape, perfect for anyone looking to enjoy Goa’s natural beauty in a quiet, picturesque setting.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _launchURL,
                    child: Text('Book a Tour'),
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the quiz button press
                    },
                    child: Text('Play Quiz!'),
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
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
