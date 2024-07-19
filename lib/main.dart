// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'app_routes.dart';

void main() {
  runApp(Rick_MortyApp(
    appRouter: AppRouter(),
  ));
}



class Rick_MortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const Rick_MortyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

//DartDataClass better DateTime
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // https://rickandmortyapi.com/api
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      // home: Scaffold(
      //   body: Text("ziko"),
      // ),
    );
  }
}