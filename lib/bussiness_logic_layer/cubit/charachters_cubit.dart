// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';
import '../../data/repositery/caractersReposetory.dart';

part 'charachters_state.dart';

class CharachtersCubit extends Cubit<CharactersState> {
  final CharactersReposetory CaractersReposetory;
  List<Characters1> characters = [];

  CharachtersCubit(
    this.CaractersReposetory,
  ) : super(CharactersInitial());

  List<Characters1> get_All_Characters() {
    CaractersReposetory.GetListOfCaracters().then(
      (characters) {
        emit(CharactersLoaded(characters));

        this.characters = characters;
      },
    );
    return characters;
  }
}
