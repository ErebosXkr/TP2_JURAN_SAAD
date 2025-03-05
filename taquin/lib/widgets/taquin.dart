import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taquin/pages/exo4.dart';

// ignore: must_be_immutable
class Taquin extends StatefulWidget{

  final int n;
  final int size;
  late String url;
  late bool playable;
  late bool shuffled;
  late Random random;

  Taquin(this.size, this.n, {super.key, String? url, bool? playable, bool? shuffled}) {
    this.url = url ?? "https://picsum.photos/1024";
    this.playable = playable ?? false;
    this.shuffled = shuffled ?? false;
    this.random = Random();
  }

  @override
  State<StatefulWidget> createState() {
    return TaquinState();
  }

}

class TaquinState extends State<Taquin> {

  List<int>? tiles;
  late List<Widget> tilesWidget;

  @override
  void initState() {
    super.initState();

    tiles = List.generate(widget.n*widget.n, (index) => index);
    tilesWidget = generateList();

    if(widget.shuffled) {
      shuffle(10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.toDouble(),
      height: widget.size.toDouble(),
      child: GridView.count(
      crossAxisCount: widget.n,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      
      children: tilesWidget),
      
    );
  }

  void move(int tileIndex) {
    if (!widget.playable) return;

    int size = widget.n;
    int targetId = size*size-1;
    int x = tileIndex%size;
    int y = tileIndex~/size;

    if (x>0 && tiles![y*size+x-1] == targetId) {
      int tmp = tiles![y*size+x];
      tiles![y*size+x] = tiles![y*size+x-1];
      tiles![y*size+x-1] = tmp;
    }

    if (x<size-1 && tiles![y*size+x+1] == targetId) {
      int tmp = tiles![y*size+x];
      tiles![y*size+x] = tiles![y*size+x+1];
      tiles![y*size+x+1] = tmp;
    }

    if (y>0 && tiles![(y-1)*size+x] == targetId) {
      int tmp = tiles![y*size+x];
      tiles![y*size+x] = tiles![(y-1)*size+x];
      tiles![(y-1)*size+x] = tmp;
    }

    if (y<size-1 && tiles![(y+1)*size+x] == targetId) {
      int tmp = tiles![y*size+x];
      tiles![y*size+x] = tiles![(y+1)*size+x];
      tiles![(y+1)*size+x] = tmp;
    }

    setState(() {
      tilesWidget = generateList();
    });
  }

  List<Widget> generateList() {
    return List.generate(widget.n*widget.n, (index) {
        int i = tiles![index]%widget.n;
        int j = tiles![index]~/widget.n;
        Alignment a = Alignment(i/(widget.n-1)*2 - 1, j/(widget.n-1)*2 - 1);

        return SizedBox(
        width: widget.size / widget.n,
        height: widget.size / widget.n,
        child: InkWell(
          onTap: () => move(index),
          child: tiles![index] != widget.n*widget.n-1 ? Stack(
            children: [
              Tile(imageURL: widget.url, alignment: a).croppedImageTile(1.0/widget.n),
              Text("${tiles![index]}", style: TextStyle(color: Colors.black, fontSize: 12),)
            ],
          ) : ColoredBox(color: Colors.white),
        )
        );}
      );
  }

  void shuffle(int n) {
    int x = widget.n-1;
    int y = widget.n-1;
    int size = widget.n;

    for (int i = 0; i < n; i++) {
      int action = widget.random.nextInt(4);

      //bas
      if (action == 0 && y>0) {
        int temp = tiles![y*size+x];
        tiles![y*size+x] = tiles![(y-1)*size+x];
        tiles![(y-1)*size+x] = temp;
        y--;
      }

      //gauche
      if (action == 1 && x>0) {
        int temp = tiles![y*size+x];
        tiles![y*size+x] = tiles![y*size+x-1];
        tiles![y*size+x-1] = temp;
        x--;
      }

      //haut
      if (action == 2 && y<size-1) {
        int temp = tiles![y*size+x];
        tiles![y*size+x] = tiles![(y+1)*size+x];
        tiles![(y+1)*size+x] = temp;
        y++;
      }

      //bas
      if (action == 3 && x<size-1) {
        int temp = tiles![y*size+x];
        tiles![y*size+x] = tiles![y*size+x+1];
        tiles![y*size+x+1] = temp;
        x++;
      }
      

    }

  }


  
}