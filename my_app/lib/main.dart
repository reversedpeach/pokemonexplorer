import 'package:flutter/material.dart';
import 'package:my_app/View/myhomepage.dart';
import 'package:my_app/model/api_service.dart';
import 'package:provider/provider.dart';

import 'ViewModel/poke_viewmodel.dart';
import 'model/poke_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokeViewModel(),
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
      title: 'Home',
      home: MyHomePage(),
    );
  }
}
