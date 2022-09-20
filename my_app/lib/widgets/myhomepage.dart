import 'package:flutter/material.dart';
import 'package:my_app/model/poke_model.dart';
import 'package:my_app/services/api_service.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int num = 1;
late Timer timer;

class _MyHomePageState extends State<MyHomePage> {
  late PokeModel _PokeModel;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    _PokeModel = (await ApiService().getUsers(num))!;
    loading = true;
    Future.delayed(const Duration(milliseconds: 0))
        .then((value) => setState(() {}));
  }

  Widget btn() {
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
              key: Key(num.toString()),
              initialValue: num.toString(),
              onChanged: (query) {
                setState(() {
                  if (int.parse(query) <= 0) {
                    return;
                  }
                  num = int.parse(query);
                  loading = false;
                  _getData();
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
                    if (num <= 1) {
                      return;
                    }
                    num--;
                    loading = false;
                    _getData();
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
                    if (num >= 999999999) {
                      return;
                    }
                    num++;
                    loading = false;
                    _getData();
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
        body: !loading
            ? const Padding(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                ),
                padding: EdgeInsets.all(90),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                btn(),
                //btn(),
                Text(
                  num.toString() + " " + _PokeModel.name,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),

                Image.network(
                  _PokeModel.sprites["front_default"],
                  scale: 0.5,
                ),
              ]));
  }
}
