import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class TourPage extends StatefulWidget {
  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  PageController _pageController = PageController();

  Future<void> _launchURL() async {
    const url = 'https://en.wikipedia.org/wiki/Old_Goa';
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
                  Image.asset('Images/oldgoa.jpg', fit: BoxFit.cover),
                  Image.asset('Images/oldgoa2.jpg', fit: BoxFit.cover),
                  Image.asset('Images/oldgoa3.jpg', fit: BoxFit.cover),
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
                          'Tour Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Explore the beautiful landscapes and tourist spots in this amazing tour. Our experienced guides will ensure a memorable experience.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The Basilica of Bom Jesus, nestled in the historic town of Old Goa, is one of India’s most iconic and sacred sites, drawing thousands of visitors from around the world every year. Built in 1605, this architectural marvel is a stunning example of Baroque and Portuguese colonial styles, with intricate detailing that reflects the craftsmanship of a bygone era.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The basilica is best known for housing the remains of St. Francis Xavier, one of Christianity’s most venerated missionaries, who played a pivotal role in spreading the faith across Asia. His relics, preserved in a silver casket within the church, are believed to have miraculous powers, and every ten years, his body is displayed for public viewing in a grand celebration that draws pilgrims from all corners of the globe.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Beyond its spiritual significance, the basilica is a visual feast. The towering façade, ornate altars gilded in gold, and rich wooden carvings offer a glimpse into Goa’s colonial past and its unique fusion of Indian and European art.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Inside, the atmosphere is tranquil and reverent, inviting visitors to pause and reflect, with beams of light filtering through the stained glass, casting colorful patterns on the stone floors.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Designated a UNESCO World Heritage Site, the Basilica of Bom Jesus is not only a place of worship but also a living monument to history, faith, and culture. Visiting this basilica is like stepping into a different time, where each corner tells a story of devotion, artistry, and the rich legacy of Goa\'s Portuguese heritage.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'For any traveler seeking to experience the true essence of Goa beyond its beaches, the Basilica of Bom Jesus is an absolute must-visit, offering a deeply enriching and unforgettable experience.',
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
