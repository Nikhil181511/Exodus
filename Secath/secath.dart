import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  _CatPageState createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
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
                  Image.asset('Images/cath.jpg', fit: BoxFit.cover),
                  Image.asset('Images/cath2.jpg', fit: BoxFit.cover),
                  Image.asset('Images/cath3.jpg', fit: BoxFit.cover),
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
                          'Se Cathedral, located in Old Goa, is one of the largest and most beautiful churches in Asia, and a must-visit for history and architecture enthusiasts. Built in the 16th century by the Portuguese, it is a stunning example of Portuguese-Gothic architecture, with intricate detailing that reflects the grandeur of its time. The cathedral’s grand white facade, towering bell tower, and sprawling interiors captivate visitors, transporting them back to a period of colonial splendor.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Dedicated to St. Catherine of Alexandria, Se Cathedral was constructed to commemorate the Portuguese victory over Muslim forces in Goa, a historical triumph that adds a layer of significance to its sacred aura.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'One of its main attractions is the Golden Bell, known for its rich, resounding chimes, which is the largest bell in Goa and revered across India.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Inside, the cathedral’s impressive interiors feature high vaulted ceilings, beautifully carved wooden altars, and magnificent paintings depicting scenes from the life of St. Catherine. The main altar, richly decorated in gilded gold, stands as a focal point, exuding elegance and grandeur.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' The cathedral is part of the UNESCO World Heritage site in Old Goa, and its tranquil atmosphere invites visitors to appreciate its spiritual and historical significance. Just a short drive from Panaji, Se Cathedral is easily accessible and often combined with visits to other nearby landmarks, like the Basilica of Bom Jesus and the Church of St. Cajetan.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'For tourists, Se Cathedral offers not just an architectural marvel but also a profound glimpse into Goa\'s cultural and religious heritage, making it a truly unforgettable experience.',
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
                    child: const Text('Book a Tour'),
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
                    child: const Text('Play Quiz!'),
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
