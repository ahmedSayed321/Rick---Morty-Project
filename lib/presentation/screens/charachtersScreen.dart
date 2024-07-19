import 'package:breaking_bad/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness_logic_layer/cubit/charachters_cubit.dart';
import '../widgets/Character_iteam.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List allCharacters;
  late List searchedForCharacters;
  bool isSearched = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        BlocProvider.of<CharachtersCubit>(context).get_All_Characters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharachtersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;

        return buildLoadedWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      color: myColors.myYellow,
    ));
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemCount: allCharacters.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        // scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CharacterItem(
            characters: allCharacters[index],
          );
        });
  }

  Widget buildSearchField() {
    return TextFormField(
      controller: searchTextController,
      cursorColor: myColors.myGrey,
      decoration: const InputDecoration(
        hintText: "Find a character",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: myColors.myGrey,
          fontSize: 22,
        )
      ),
      style: const TextStyle(fontSize: 22,color: myColors.myGrey),
      onChanged: (searchedCharacter){
     addSearchedForItemsToSearchList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchList(String searchedCharacter) {
    //searchedForCharacters = allCharacters.where((element) => _element.asNameMap()) ).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.myYellow,
        centerTitle: true,
        title: const Text(
          "Characters",
          style: TextStyle(color: myColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }


}
