// ignore: file_names
// ignore: file_names

import 'package:bmi/pages/ShowOutput.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = '';
    weightController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: const Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 246, 246, 246)),),
        backgroundColor: Color.fromARGB(255, 59, 135, 211),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
           
            children: [
              Image.asset('imges/bmi.png') ,
              const SizedBox(height: 20),
              new Container(
                color: Color.fromARGB(255, 68, 234, 165),
              ),
              const Text('ส่วนสูง (Height)'),
              
              TextFormField(
                textAlign: TextAlign.center,
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              const Text('น้ำหนัก (Weight)'),
              TextFormField(
                textAlign: TextAlign.center,
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double weight = double.tryParse(weightController.text) ?? 0;
                  double heightInCm =
                      double.tryParse(heightController.text) ?? 0;
                  double bmi;

                  if (heightInCm > 0 && weight > 0) {
                    double heightInMeters =
                        heightInCm / 100; // แปลงความสูงเป็นเมตร
                    bmi = weight / (heightInMeters * heightInMeters);
                    // คุณสามารถใช้ bmi ที่ได้รับในการคำนวณต่อไปได้ตามต้องการ

                    // Navigate to the BMIResultPage and pass the BMI value
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowOutPut(bmiValue: bmi),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('กรุณาป้อนเลข'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('คำนวณ BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}