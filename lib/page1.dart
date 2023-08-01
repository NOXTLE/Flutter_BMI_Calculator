import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController namez = TextEditingController();
  final TextEditingController feet = TextEditingController();
  final TextEditingController inches = TextEditingController();
  final TextEditingController kg = TextEditingController();
  var meters;
  var ftz;
  var kgz;
  var pounds;

  var bmi;
  Color mycolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
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
                'https://static.vecteezy.com/system/resources/previews/001/198/029/original/grid-globe-map-png.png',
                height: 100,
                width: 100),
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
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(children: [
                Flexible(
                  child: TextField(
                    controller: feet,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Ft'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: TextField(
                  controller: inches,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'inches'),
                ))
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: kg,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Weight in Kg'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.orange.shade800)),
              onPressed: () {
                meters = (int.parse(feet.text) * 0.3048 +
                        int.parse(inches.text) * 0.0254) *
                    (int.parse(feet.text) * 0.3048 +
                        int.parse(inches.text) * 0.0254);

                pounds = int.parse(kg.text);
                bmi = pounds / meters;
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
                                        ? const Text('Underweight')
                                        : bmi < 24.9
                                            ? const Text('Normal')
                                            : bmi < 29.9
                                                ? const Text('OverWeight')
                                                : bmi < 34.9
                                                    ? const Text('Obese I')
                                                    : bmi < 39.9
                                                        ? const Text('Obese II')
                                                        : const Text(
                                                            'Obese III')
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
