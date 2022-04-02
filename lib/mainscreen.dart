
import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';


import 'ResultsPage.dart';
import 'card.dart';
import 'icon.dart';

enum gender { Male, Female }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int weight = 65;
  int height = 180;
  int age = 20;
  gender SGender=gender.Male;
  Color InactiveCardColour = Color(0xFF1D1E33);
  Color ActiveCardColour = Color(0xFFEB1555);
  //Color(0xFF1D1E33)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 33, 54),
      ),
      bottomNavigationBar: Material(
        color: const Color(0xFFEB1555),
        child: InkWell(
          onTap: () {
            BmiLogic calc =
            BmiLogic(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          child: const SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 29, 33, 54),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap:(){
                      setState(() {
                        SGender=gender.Male;
                      });
                    } ,
                    child: Container(
                      child: iconshape(

                        icon: Icons.male,
                        label: 'MALE',

                      ),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: SGender == gender.Male ? ActiveCardColour : InactiveCardColour,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  )),
              Expanded(
                  child: GestureDetector(
                    onTap:(){
                      setState(() {
                        SGender=gender.Female;
                      });
                    } ,
                    child: Container(
                      child: iconshape(
                        icon: Icons.female,
                        label: 'MALE',
                      ),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: SGender == gender.Female ? ActiveCardColour : InactiveCardColour,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  )),

            ],
          )
          ),
          Expanded(
            child: ElementCard(
              color: ActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SliderTheme(

                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFEB1555),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              elevation: 0.0,
                              child:Icon(Icons.exposure_minus_1),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFFEB1555),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
              elevation: 0.0,
              child:Icon(Icons.plus_one),
              onPressed: () {
                setState(() {
                  weight++;
                });
              },
              constraints: BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
              ),
              shape: CircleBorder(),
              fillColor: Color(0xFFEB1555),
            ),
                          ],
                        ),
                      ],
                    ),
                  ) ,
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              elevation: 0.0,
                              child:Icon(Icons.exposure_minus_1),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFFEB1555),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              //elevation: 0.0,
                              child:Icon(Icons.plus_one),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFFEB1555),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ) ,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}



