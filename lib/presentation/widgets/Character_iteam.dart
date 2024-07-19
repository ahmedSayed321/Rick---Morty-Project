import 'package:breaking_bad/presentation/screens/charactersDetails.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
   final Characters1 characters;
  //final  character;
  const CharacterItem({super.key, required this.characters});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, characterDetailsScreenn  ,arguments: characters);
        },
        child: GridTile(
          footer: Hero(
            tag: characters.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                characters.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          child: Container(
              color: myColors.myGrey,
              child: characters.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: characters.image)
                  : Image.asset('assets/images/Screenshot_1713297862.png')),
        ),
      ),
    );
  }
}
