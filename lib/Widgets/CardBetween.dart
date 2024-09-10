import 'package:flutter/material.dart';

class CardBetween extends StatelessWidget {
  final String imagePath; // Image path parameter
  final String text; // Text parameter for each card

  const CardBetween({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imagePath), // Use the provided image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
    );
  }
}
