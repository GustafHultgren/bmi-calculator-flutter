import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String label;
  BottomButton({this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(label, style: kLargeButtonTextStyle),
        ),
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.redAccent[400],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}