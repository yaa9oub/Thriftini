import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String txt;

  CustomButton({this.txt});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.70,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff0962ff),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
