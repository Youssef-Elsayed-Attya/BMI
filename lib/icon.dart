import 'package:flutter/material.dart';
class iconshape extends StatelessWidget {
 iconshape({required this.icon,required this.label});
 final IconData icon;
 final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style:TextStyle(
            fontSize: 18.0,
            color: Colors.white,

          ),
        )
      ],
    );
  }
}
