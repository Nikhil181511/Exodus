import 'package:flutter/material.dart';
import 'package:fisher/fisher.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FishPage(),
    );
  }
}
