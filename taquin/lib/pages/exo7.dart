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
  late String btext;

  @override
  void initState() {
    super.initState();
    div = 4;
    playable = false;
    url = "https://picsum.photos/1024";
    btext = "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Jeu de Taquin'),
        centerTitle: true,
      ),

      body: Column(children: [
          Taquin(300, div, url: url, playable: playable, key: UniqueKey()),
          TextButton(onPressed: () {

            if (btext == "Start") {
              setState(() {
                btext = "Stop";
                playable = true;
              });
            }
            else {
              setState(() {
                btext = "Start";
                playable = false;
              });
            }

          }, child: Text(btext)),
          Slider(value: div.toDouble(), max: 8, min: 2, divisions: 5, onChanged: (value) => setState(() {
            if (playable) return;
            div = value.toInt();
          }), activeColor: playable ? Colors.grey : Colors.blue,)
        ],
      )

    );
  }
  
}