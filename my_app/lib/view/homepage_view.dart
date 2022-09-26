import 'package:flutter/material.dart';
import 'package:my_app/view/number_editor_view.dart';
import 'package:my_app/view/pokemon_view.dart';
import 'package:my_app/view_model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [NumberEditorView(), PokemonView()]));
  }
}
