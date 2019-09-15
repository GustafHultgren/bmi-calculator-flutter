import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/panel.dart';
import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

class ResultScreen extends StatelessWidget {
  final Calculator bmiData;

  ResultScreen({@required this.bmiData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Panel(
            flex: 5,
            selected: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  bmiData.result.toUpperCase(),
                  style: TextStyle(
                    color: Colors.greenAccent[400],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmiData.bmi.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmiData.interpretation,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
