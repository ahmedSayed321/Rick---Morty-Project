import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/presentation/widgets/build_sliver_appBar.dart';
import 'package:breaking_bad/presentation/widgets/character_info.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Characters1 characters;
  const CharacterDetailsScreen(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myGrey,
      body: CustomScrollView(
        slivers: [
          //buildSilverAppBar(),
          SliverAppBarWidget(characters),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CharacterInfo1("Status : ", characters.status),
                  buildDivider(314),
                  CharacterInfo1("Species : ", characters.species),
                  buildDivider(290),
                  CharacterInfo1("Gender : ", characters.gender),
                  buildDivider(295),
                  const SizedBox(height: 600)
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: myColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
