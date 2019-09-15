import 'dart:math';

import 'package:flutter/widgets.dart';

class Calculator {
  final int height;
  final int weight;

  Calculator({@required this.height, @required this.weight});

  double get bmi {
    return weight / pow(height / 100, 2);
  }

  String get result {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String get interpretation {
    if (bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if(bmi >= 18.5){
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  get bmiData {
    return {
      'bmi': bmi.toStringAsFixed(1),
      'result': result,
      'interpretation': interpretation
    };
  }
}
