import 'package:flutter/material.dart';
import 'package:pallolem_info/palo.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaloPage(),
    );
  }
}
