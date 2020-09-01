import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  RoundIcon({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onPressed,
      highlightColor: Color(0xFFF08080),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
