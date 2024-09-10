import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learnhookflutter/Widgets/Arithmatic.dart';
import 'package:learnhookflutter/Widgets/BMI.dart';
import 'package:learnhookflutter/Widgets/Shape_list.dart';
import 'package:learnhookflutter/Widgets/CardBetween.dart';

class Between extends HookWidget {
  const Between({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Arithmetic()),
                );
              },
              child: const CardBetween(
                imagePath: 'lib/images/aritmatika.png',
                text: 'Arithmetic', // Unique text
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMICalculator()),
                );
              },
              child: const CardBetween(
                imagePath: 'lib/images/BMI.png',
                text: 'BMI Calculator', // Unique text
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardListView()),
                );
              },
              child: const CardBetween(
                imagePath: 'lib/images/bangundatar.png',
                text: 'Bangun Datar', // Unique text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
