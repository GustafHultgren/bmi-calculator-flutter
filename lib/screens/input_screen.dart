import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

const double bottomContainerHeight = 80;
const activePanelColor = Color(0xFF1D1E33);
const inactivePanelColor = Color(0xFF111328);
const TextStyle kLabelTextStyle = TextStyle(fontSize: 18, color: Colors.grey);
const TextStyle kNumberTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender _gender;
  int _height = 180;
  int _weight = 60;

  Color getGenderPanelColor(Gender gender) {
    return gender == this._gender ? activePanelColor : inactivePanelColor;
  }

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
              Panel(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      _weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => this.weight = _weight + 1,
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(icon: FontAwesomeIcons.minus),
                      ],
                    )
                  ],
                ),
              ),
              Panel(),
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.redAccent[400],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            width: double.infinity,
            height: bottomContainerHeight,
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

class Panel extends StatelessWidget {
  final Widget child;
  final bool selected;
  final Function onTap;
  Panel({this.selected = false, this.child, this.onTap});

  Color get color {
    return selected ? activePanelColor : inactivePanelColor;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: child,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
