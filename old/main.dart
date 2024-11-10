import 'package:flutter/material.dart';
import 'package:oldgoa_page/tour_page.dart'; // Import the TourPage widget from tour_page.dart

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TourPage(),
    );
  }
}
