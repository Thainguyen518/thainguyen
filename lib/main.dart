import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(),
    );
  }
}
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}
class _CalculatorPageState extends State<CalculatorPage> {
  final aController = TextEditingController();
  final bController = TextEditingController();
  final nController = TextEditingController();
  String result = "";
  void _calculate() {
    int? a = int.tryParse(aController.text);
    int? b = int.tryParse(bController.text);
    if (a == null || b == null) {
      _showMessage("Vui lòng nhập số hợp lệ cho A và B");
      return;
    }
    setState(() {
      result = "A + B = ${a + b}\nA - B = ${a - b}\nA * B = ${a * b}\nA / B = ${b != 0 ? (a / b).toStringAsFixed(2) : "Không thể chia cho 0"}";
    });
  }
  void _checkPrime() {
    int? n = int.tryParse(nController.text);
    if (n == null) {
      _showMessage(" số không hợp lệ");
      return;
    }
    bool isPrime = n > 1 && List.generate(n - 2, (i) => i + 2).every((i) => n % i != 0);
    _showMessage(isPrime ? "$n là số nguyên tố" : "$n không phải là số nguyên tố");
  }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Tính Số Nguyên Tố")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: aController, decoration: InputDecoration(labelText: "Hãy Nhập số A"),
                keyboardType: TextInputType.number),
            TextField(controller: bController, decoration: InputDecoration(labelText: "Hãy Nhập số B"),
                keyboardType: TextInputType.number),
            ElevatedButton(onPressed: _calculate, child: Text("Tính")),
            Text(result),
            Divider(),
            TextField(controller: nController, decoration: InputDecoration(labelText: "Nhập số n"),
                keyboardType: TextInputType.number),
            ElevatedButton(onPressed: _checkPrime, child: Text("Kiểm tra số nguyên tố")),
          ],
        ),
      ),
    );
  }
}
