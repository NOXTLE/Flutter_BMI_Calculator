import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int curindex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.pink,
          body:
              IndexedStack(index: curindex, children: const [Page1(), Page2()]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: curindex,
            backgroundColor: Colors.deepPurpleAccent,
            selectedItemColor: Colors.white,
            onTap: (value) {
              setState(() {
                curindex = value;
                print(curindex);
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.monitor_weight_outlined),
                  label: 'Kg / feet'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.height_rounded), label: 'Kg / meters')
            ],
          ),
        ));
  }
}
