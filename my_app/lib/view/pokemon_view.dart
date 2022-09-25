import 'package:flutter/material.dart';
import 'package:my_app/view_model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({super.key});

  @override
  PokemonViewState createState() => PokemonViewState();
}

class PokemonViewState extends State<PokemonView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<PokeViewModel>(builder: (context, provider, child) {
      return provider.loadingStatus()
          ? const Padding(
              padding: EdgeInsets.all(90),
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                provider.getPokeTitle(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Image.network(
                provider.getPokeImg(),
                scale: 0.5,
              ),
            ]);
    }));
  }
}
