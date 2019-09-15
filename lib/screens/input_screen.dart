import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/panel.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

class InputScreen extends StatefulWidget {
  static String id = 'inputScreen';
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender _gender;
  int _height = 180;
  int _weight = 60;
  int _age = 18;

  void setGender(Gender gender) {
    setState(() {
      _gender = _gender == gender ? null : gender;
    });
  }

  set weight(int weight) {
    setState(() {
      _weight = weight >= 0 ? weight : 0;
    });
  }

  set height(int height) {
    setState(() {
      _height = height >= 0 ? height : 0;
    });
  }

  set age(int age) {
    setState(() {
      _age = age >= 0 ? age : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Panel(
                selected: _gender == Gender.MALE,
                onTap: () => setGender(Gender.MALE),
                child: IconContent(
                  icon: FontAwesomeIcons.mars,
                  text: 'MALE',
                ),
              ),
              Panel(
                selected: _gender == Gender.FEMALE,
                onTap: () => setGender(Gender.FEMALE),
                child: IconContent(
                  icon: FontAwesomeIcons.venus,
                  text: 'FEMALE',
                ),
              ),
            ],
          )),
          Panel(
            selected: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(_height.toString(), style: kNumberTextStyle),
                    Text('cm', style: kLabelTextStyle)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.pink[700],
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    activeTrackColor: Colors.white,
                    overlayColor: Colors.pink[700].withOpacity(0.16),
                  ),
                  child: Slider(
                    value: _height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      setState(() {
                        _height = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              MetricPanel(
                label: 'Weight',
                metric: _weight,
                incBy: (val) => this.weight = _weight + val,
              ),
              MetricPanel(
                label: 'age',
                metric: _age,
                incBy: (val) => this.age = _age + val,
              ),
            ],
          )),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: _height, weight: _weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultScreen(bmiData: calc)));
            },
          )
        ],
      ),
    );
  }
}

class MetricPanel extends StatelessWidget {
  final String label;
  final int metric;
  final Function incBy;

  MetricPanel({this.label, this.metric, this.incBy});

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            metric.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () => incBy(1),
              ),
              SizedBox(width: 10),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () => incBy(-1),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      disabledElevation: 6,
      shape: CircleBorder(),
      fillColor: Colors.white.withOpacity(0.25),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
    );
  }
}

class IconContent extends StatelessWidget {
  final text;
  final icon;

  IconContent({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text, style: kLabelTextStyle),
      ],
    );
  }
}
