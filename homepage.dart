import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Discover a city',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            // Featured Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'Images/oldgoa.jpg', // Main image at the top
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Basilica de Bom Jesus',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('North Goa'),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        // Add navigation or action here
                      },
                    ),
                  ),
                  // Horizontal ListView starts here
                  Container(
                    height: 180, // You can adjust the height as per your needs
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // First Card Item in the horizontal list
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 140, // Width of each card
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'Images/oldgoa.jpg', // Example image for the card
                                    height:
                                        100, // Adjust the height of the image
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Old Goa',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Place 1'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Space between cards
                        // Second Card Item in the horizontal list
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'Images/oldgoa.jpg', // Example image for the card
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Old Goa',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Place 2'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Space between cards
                        // Third Card Item in the horizontal list
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'Images/oldgoa.jpg', // Example image for the card
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Old Goa',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Place 3'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Space between cards
                        // Add more cards as needed...
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Categories
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Show All',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Category Icons
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/category1.jpg')), // Replace with category images
                  SizedBox(width: 10),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/category2.jpg')),
                  SizedBox(width: 10),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/category3.jpg')),
                  SizedBox(width: 10),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/category4.jpg')),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
