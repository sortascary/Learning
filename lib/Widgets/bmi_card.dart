import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final double bmi;
  final String message;

  const BMICard({
    Key? key,
    required this.bmi,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bmi == 0) {
      return const Text(
        'Masukkan tinggi dan berat badan yang benar untuk menghitung BMI.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      );
    }

    return Card(
      color: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'BMI Anda: ${bmi.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
