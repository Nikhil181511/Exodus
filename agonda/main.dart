import 'package:flutter/material.dart';
import 'package:agonda_info/agonda.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgoPage(),
    );
  }
}
