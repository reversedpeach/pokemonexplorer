import 'package:flutter/material.dart';
import 'package:my_app/view/homepage_view.dart';
import 'package:provider/provider.dart';

import 'view_model/poke_viewmodel.dart';
import 'model/poke_model.dart';

late PokeModel model;

void launchModel() {
  var sprites;
  model = PokeModel(name: "no data", sprites: sprites);
}

void main() {
  launchModel();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokeViewModel(model: model),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokemon Editor',
      home: HomePage(),
    );
  }
}
