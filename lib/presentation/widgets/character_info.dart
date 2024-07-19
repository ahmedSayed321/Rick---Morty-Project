import 'package:breaking_bad/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CharacterInfo1 extends StatelessWidget {
  String title;
  String value;
   CharacterInfo1( this.title,this.value,{super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: myColors.myWhite)),
          TextSpan(
              text: value,
              style: const TextStyle(fontSize: 18, color: myColors.myWhite))
        ]));
  }
}
