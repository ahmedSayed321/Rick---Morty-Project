import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussiness_logic_layer/cubit/charachters_cubit.dart';
import 'constants/strings.dart';
import 'data/api_Serveses/characters_ApiServes.dart';
import 'data/models/characters.dart';
import 'data/repositery/caractersReposetory.dart';
import 'presentation/screens/charachtersScreen.dart';
import 'presentation/screens/charactersDetails.dart';

class AppRouter {
  late CharactersReposetory CaractersReposetory;
  late CharachtersCubit charachtersCubit;
  AppRouter() {
    CaractersReposetory = CharactersReposetory(characterWebServes());

    charachtersCubit = CharachtersCubit(CaractersReposetory);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreenn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charachtersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreenn:
        final character = settings.arguments as Characters1;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character));
    }
  }
}
