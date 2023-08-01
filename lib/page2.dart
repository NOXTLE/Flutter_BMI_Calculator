import 'dart:math';

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController namez = TextEditingController();
  final TextEditingController meter = TextEditingController();

  final TextEditingController pound = TextEditingController();
  double? metersq;
  var bmi;
  Color mycolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150, bottom: 25),
              child: Text(
                'Check BMI',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
            ),
            Image.network(
              'https://w0.peakpx.com/wallpaper/341/433/HD-wallpaper-american-eagle-flag-raptor-symbol-artwork.jpg',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: namez,
                enabled: true,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green, width: 4)),
                    hintText: 'Enter your Name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 2, color: Colors.purple))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: Row(children: [
                Flexible(
                  child: TextField(
                    controller: meter,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Meters'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: pound,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Kg'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: () {
                metersq = double.parse(meter.text) * double.parse(meter.text);
                bmi = double.parse(pound.text) / metersq!;
                setState(() {
                  if (bmi <= 18) {
                    mycolor = Colors.blueGrey;
                  } else if (bmi < 24.9) {
                    mycolor = Colors.lightGreen;
                  } else if (bmi < 29.9) {
                    mycolor = Colors.red.shade400;
                  } else if (bmi < 34.9) {
                    mycolor = Colors.red.shade700;
                  } else {
                    mycolor = Colors.red.shade900;
                  }
                });

                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(color: mycolor),
                            child: Column(
                              children: [
                                const Text('YOUR BMI'),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Name : '),
                                      Text(namez.text),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Your BMI is : '),
                                      Text(bmi.toStringAsFixed(2)),
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Review: '),
                                    bmi <= 18
                                        ? Text('Underweight')
                                        : bmi < 24.9
                                            ? Text('Normal')
                                            : bmi < 29.9
                                                ? Text('OverWeight')
                                                : bmi < 34.9
                                                    ? Text('Obese I')
                                                    : bmi < 39.9
                                                        ? Text('Obese II')
                                                        : Text('Obese III')
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.speed),
              label: const Text('Calculate'),
            )
          ],
        ),
      ),
    );
  }
}
