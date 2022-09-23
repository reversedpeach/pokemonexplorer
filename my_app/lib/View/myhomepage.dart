import 'package:flutter/material.dart';
import 'package:my_app/model/poke_model.dart';
import 'package:my_app/ViewModel/poke_viewmodel.dart';
import 'package:my_app/model/api_service.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late PokeModel _PokeModel;
  //late final _PokeViewModel = PokeViewModel(num: 1);

  @override
  void initState() {
    super.initState();
    Provider.of<PokeViewModel>(context, listen: false).getData();
  }

  Widget numberEditor() {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0x33333333)),
      ),
      child: Consumer<PokeViewModel>(builder: (context, provider, child) {
        return Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorHeight: 23,
                textAlign: TextAlign.center,
                autofocus: true,
                style: const TextStyle(fontSize: 18.0, height: 2.2),
                key: Key(provider.getNumString()),
                initialValue: provider.getNumString(),
                onChanged: (query) {
                  setState(() {
                    if (int.parse(query) <= 0) {
                      return;
                    }
                    provider.changeNum(query);
                    //num = int.parse(query);
                    provider.loadingTrue();

                    provider.getData();
                  });
                },
              ),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.remove),
                  ),
                  onTap: () {
                    setState(() {
                      if (provider.getNumInt() <= 1) {
                        return;
                      }
                      provider.decreaseNum();
                      provider.loadingTrue();
                      //_PokeViewModel.getData();
                      provider.getData();
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.add),
                  ),
                  onTap: () {
                    setState(() {
                      if (provider.getNumInt() >= 999999999) {
                        return;
                      }
                      provider.increaseNum();
                      provider.loadingTrue();
                      provider.getData();
                    });
                  },
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PokeViewModel>(builder: (context, provider, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        numberEditor(),
        provider.loadingStatus()
            ? const Padding(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                ),
                padding: EdgeInsets.all(90),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  provider.getNumString() + " " + provider.getPokeName(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Image.network(
                  provider.getPokeImg(),
                  scale: 0.5,
                ),
              ])
      ]);
    }));
  }
}
