import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Characters1 characters;
   SliverAppBarWidget(this.characters,{super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //centerTitle: true,
      expandedHeight: 700,
      backgroundColor: myColors.myGrey,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          characters.name,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: myColors.myBlack,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        titlePadding: const EdgeInsets.only(right: 7),
        centerTitle: true,
        background: Hero(
            tag: characters.id,
            child: Image.network(
              characters.image,
              fit: BoxFit.cover,
            )),
      ),
    );  }
}
