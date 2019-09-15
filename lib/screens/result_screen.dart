import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          // Expanded(
          //   flex: 5,
          // )
        ],
      ),
    );
  }
}
