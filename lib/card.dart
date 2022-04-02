import 'package:flutter/material.dart';
class ElementCard extends StatelessWidget{
  ElementCard({this.onPress,required this.cardChild,required this.color});


  final Widget cardChild;
  final  onPress;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }

}