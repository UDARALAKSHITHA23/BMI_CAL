import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final String imageParth;
  const SquareTitle({super.key, required this.imageParth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 243, 238, 238)),
      child: Image.asset(
        imageParth,
        height: 40,
      ),
    );
  }
}
