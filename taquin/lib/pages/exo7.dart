import 'package:flutter/material.dart';
import 'package:taquin/widgets/taquin.dart';

class Exo7 extends StatefulWidget {
  const Exo7({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return Exo7State();
  }
  
}

class Exo7State extends State<Exo7> {

  late int div;
  late bool playable;
  late String url;

  @override
  void initState() {
    super.initState();
    div = 4;
    playable = false;
    url = "https://picsum.photos/1024";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Jeu de Taquin'),
        centerTitle: true,
      ),

      body: Taquin(300, div, url: url, playable: playable),

    );
  }
  
}