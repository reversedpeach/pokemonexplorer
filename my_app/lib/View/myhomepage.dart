import 'package:flutter/material.dart';
import 'package:my_app/model/poke_model.dart';
import 'package:my_app/ViewModel/poke_viewmodel.dart';
import 'package:my_app/model/api_service.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late PokeModel _PokeModel;
  late final _PokeViewModel = PokeViewModel(num: 1);

  @override
  void initState() {
    super.initState();
    _PokeViewModel.getData();
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              cursorHeight: 23,
              textAlign: TextAlign.center,
              autofocus: true,
              style: const TextStyle(fontSize: 18.0, height: 2.2),
              key: Key(_PokeViewModel.getNumString()),
              initialValue: _PokeViewModel.getNumString(),
              onChanged: (query) {
                setState(() {
                  if (int.parse(query) <= 0) {
                    return;
                  }
                  _PokeViewModel.changeNum(query);
                  //num = int.parse(query);
                  _PokeViewModel.loadingTrue();
                  _PokeViewModel.getData();
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
                    if (_PokeViewModel.getNumInt() <= 1) {
                      return;
                    }
                    _PokeViewModel.decreaseNum();
                    _PokeViewModel.loadingTrue();
                    _PokeViewModel.getData();
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
                    if (_PokeViewModel.getNumInt() >= 999999999) {
                      return;
                    }
                    _PokeViewModel.increaseNum();
                    _PokeViewModel.loadingTrue();
                    _PokeViewModel.getData();
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      numberEditor(),
      !_PokeViewModel.loadingStatus()
          ? const Padding(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
              padding: EdgeInsets.all(90),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                _PokeViewModel.getNumString() +
                    " " +
                    _PokeViewModel.getPokeName(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Image.network(
                _PokeViewModel.getPokeImg(),
                scale: 0.5,
              ),
            ])
    ]));
  }
}
