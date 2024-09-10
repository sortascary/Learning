import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learnhookflutter/Widgets/input_field.dart';

class Arithmetic extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan Hook untuk mengelola TextEditingController
    final number1Controller = useTextEditingController(); // <- Flutter Hook
    final number2Controller = useTextEditingController(); // <- Flutter Hook

    // Menggunakan Hook untuk mengelola state dari hasil perhitungan
    final result = useState<double?>(null); // <- Flutter Hook

    // Menggunakan Hook untuk mengelola state dari operasi yang terakhir dijalankan
    final lastOperation = useState<String?>(null); // <- Flutter Hook

    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmatic Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InputField(controller: number1Controller, label: 'First Number'),
            SizedBox(height: 10),
            InputField(controller: number2Controller, label: 'Second Number'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 + num2; // <- Update state
                      lastOperation.value = '+'; // <- Set last operation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        lastOperation.value == '+' ? Color(0xFF003049) : null,
                    foregroundColor: Color.fromARGB(
                        255, 0, 0, 0), // Mengatur warna font menjadi putih
                  ),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 - num2; // <- Update state
                      lastOperation.value = '-'; // <- Set last operation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        lastOperation.value == '-' ? Color(0xFFD62828) : null,
                    foregroundColor: const Color.fromARGB(
                        255, 0, 0, 0), // Mengatur warna font menjadi putih
                  ),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 * num2; // <- Update state
                      lastOperation.value = 'x'; // <- Set last operation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        lastOperation.value == 'x' ? Color(0xFFF77F00) : null,
                    foregroundColor: const Color.fromARGB(
                        255, 0, 0, 0), // Mengatur warna font menjadi putih
                  ),
                  child: Text('x'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null && num2 != 0) {
                      result.value = num1 / num2; // <- Update state
                      lastOperation.value = '/'; // <- Set last operation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        lastOperation.value == '/' ? Color(0xFFFCBF49) : null,
                    foregroundColor: const Color.fromARGB(
                        255, 0, 0, 0), // Mengatur warna font menjadi putih
                  ),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (result.value != null)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: _getResultColor(lastOperation
                      .value), // Warna latar belakang hasil sesuai operasi
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hasil: ${result.value}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white, // Teks berwarna putih agar kontras
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan warna hasil sesuai operasi terakhir
  Color _getResultColor(String? operation) {
    switch (operation) {
      case '+':
        return Color(0xFF003049);
      case '-':
        return Color(0xFFD62828);
      case 'x':
        return Color(0xFFF77F00);
      case '/':
        return Color(0xFFFCBF49);
      default:
        return Colors.blue; // Default color jika tidak ada operasi
    }
  }
}
