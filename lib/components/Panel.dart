import 'package:flutter/material.dart';

const activePanelColor = Color(0xFF1D1E33);
const inactivePanelColor = Color(0xFF111328);

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