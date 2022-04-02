import 'package:bmi/icon.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'mainscreen.dart';
enum gender { Male, Female }

void main() => runApp(BMI());

class BMI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

