// ignore: file_names
import 'package:flutter/material.dart';

class ShowOutPut extends StatelessWidget {
  final double bmiValue;

  const ShowOutPut({super.key, required this.bmiValue});

  @override
  Widget build(BuildContext context) {
    String result;
    Color resultColor;

    if (bmiValue < 18.5) {
      result = 'น้ำหนักน้อยกว่ามาตรฐาน';
      resultColor = Colors.blue; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 18.5 && bmiValue <= 22.9) {
      result = 'น้ำหนักปกติ';
      resultColor = Colors.green; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 23 && bmiValue <= 24.9) {
      result = 'น้ำหนักเกินมาตรฐาน (อันตราย)';
      resultColor = Colors.orange; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      result = 'โรคอ้วน';
      resultColor = Colors.red; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else {
      result = 'โรคอ้วนขั้นสูง (อันตรายมาก)';
      resultColor = Colors.purple; // หรือสีอื่นๆ ตามที่คุณต้องการ
    }

// แล้วคุณสามารถใช้ resultColor ในการตั้งค่าสีของข้อความที่แสดงบนหน้าจอได้

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการคำนวณ BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ค่า BMI ของคุณคือ: ${bmiValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                color: resultColor, // ใช้ resultColor ที่ได้จากเงื่อนไข BMI
                fontSize: 24, // ตั้งค่าขนาดตัวอักษรตามที่คุณต้องการ
                fontWeight: FontWeight.bold, // ตั้งค่าความหนาของตัวอักษร
              ),
            )
          ],
        ),
      ),
    );
  }
}