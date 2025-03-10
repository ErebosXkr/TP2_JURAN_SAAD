import 'package:flutter/material.dart';
import 'package:taquin/widgets/taquin.dart';

class Exo5 extends StatefulWidget {
  late String url;

  Exo5({super.key}) {
    url = "https://picsum.photos/1024";
  }

  @override
  State<StatefulWidget> createState() {
    return Exo5State();
  }
}

class Exo5State extends State<Exo5> {
  double div = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Génération du plateau de tuiles',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Taquin(200, div.round(), key: UniqueKey()),
            Slider(
              value: div,
              onChanged: (newValue) {
                setState(() {
                  div = newValue;
                });
              },
              min: 2,
              max: 8,
              divisions: 5,
            ),
          ],
        ),
      ),
    );
  }
}