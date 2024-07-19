part of 'charachters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Characters1> characters;

  CharactersLoaded(this.characters);
}

class CharactersLoading extends CharactersState {}

class CharactersFailuer extends CharactersState {}
