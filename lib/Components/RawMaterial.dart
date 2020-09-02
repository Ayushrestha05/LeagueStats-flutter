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

class AbilitySpells extends StatelessWidget {
  final String spellName;
  final String spellImage;
  final String spellDesc;
  AbilitySpells({this.spellName, this.spellImage, this.spellDesc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(spellName),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image(
                image:
                    AssetImage('resources/images/champion/spell/$spellImage'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(spellDesc),
            ),
          ],
        ),
      ],
    );
  }
}
