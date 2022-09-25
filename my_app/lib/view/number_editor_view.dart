import 'package:flutter/material.dart';
import 'package:my_app/view_model/poke_viewmodel.dart';
import 'package:provider/provider.dart';

class NumberEditorView extends StatefulWidget {
  const NumberEditorView({super.key});

  @override
  NumberEditorViewState createState() => NumberEditorViewState();
}

class NumberEditorViewState extends State<NumberEditorView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
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
                    provider.queryInput(query);
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
                    child: const Icon(Icons.remove),
                  ),
                  onTap: () {
                    setState(() {
                      provider.decButtonClick();
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: const Icon(Icons.add),
                  ),
                  onTap: () {
                    setState(() {
                      provider.incButtonClick();
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
}
