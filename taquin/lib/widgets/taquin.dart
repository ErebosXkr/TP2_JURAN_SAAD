import 'package:flutter/material.dart';
import 'package:taquin/pages/exo4.dart';

// marche pas de fou
class Taquin extends StatefulWidget{

  final int n;
  final int size;
  late String url;
  late bool playable;

  Taquin(this.size, this.n, {super.key, String? url, bool? playable}) {
    this.url = url ?? "https://picsum.photos/1024";
    this.playable = playable ?? false;
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


  
}