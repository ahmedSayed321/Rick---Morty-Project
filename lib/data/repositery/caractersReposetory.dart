import '../api_Serveses/characters_ApiServes.dart';
import '../models/characters.dart';

class CharactersReposetory {
  final characterWebServes characterswebserves;

  CharactersReposetory(this.characterswebserves);

  Future<List<Characters1>> GetListOfCaracters() async {
    final characters = await characterswebserves.GetAllCaracters();
    // List listy =
    //     characters.map((character) => Characters.fromJson(character)).toList();
    // // print(listy[0]);

    return characters
        .map((character) => Characters1.fromJson(character))
        .toList();

    //List ListOfCharacters = [];

    // for (var element in characters) {
    //   ListOfCharacters.add(Characters.fromJson(element));
    //   print("//////////////////////a11");

    //   print(Characters.fromJson(element));
    // }
    // print("//////////////////////a11");
    // print(ListOfCharacters[0]);

    // return ListOfCharacters;
  }
}
