import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'input_field.dart';
import 'bmi_card.dart';

class BMICalculator extends HookWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightController = useTextEditingController();
    final weightController = useTextEditingController();
    final bmi = useState(0.0);
    final message = useState('');

    void calculateBMI() {
      final height = double.tryParse(heightController.text) ?? 0;
      final weight = double.tryParse(weightController.text) ?? 0;

      if (height > 0 && weight > 0) {
        bmi.value = weight / ((height / 100) * (height / 100));

        if (bmi.value < 18.5) {
          message.value = 'Anda perlu makan lebih banyak, BMI Anda rendah.';
        } else if (bmi.value >= 18.5 && bmi.value < 24.9) {
          message.value =
              'Bagus! BMI Anda normal, pertahankan gaya hidup sehat.';
        } else if (bmi.value >= 24.9 && bmi.value < 29.9) {
          message.value =
              'BMI Anda sedikit berlebih, pertimbangkan diet sehat.';
        } else {
          message.value = 'BMI Anda tinggi, mungkin perlu diet dan olahraga.';
        }
      } else {
        bmi.value = 0.0;
        message.value = 'Masukkan tinggi dan berat badan yang valid.';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kalkulator BMI',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            InputField(
              controller: heightController,
              label: 'Tinggi Badan (cm)',
              icon: Icons.height,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: weightController,
              label: 'Berat Badan (kg)',
              icon: Icons.fitness_center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Hitung BMI'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
            const SizedBox(height: 24),
            BMICard(
              bmi: bmi.value,
              message: message.value,
            ),
          ],
        ),
      ),
    );
  }
}
