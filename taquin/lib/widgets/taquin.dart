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

  @override
  void initState() {
    super.initState();

    tiles = List.generate(widget.n*widget.n, (index) => index);
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
      
      children: List.generate(widget.n*widget.n, (index) {
        int i = index%widget.n;
        int j = index~/widget.n;
        Alignment a = Alignment(i/(widget.n-1)*2 - 1, j/(widget.n-1)*2 - 1);

        return SizedBox(
        width: widget.size / widget.n,
        height: widget.size / widget.n,
        child: InkWell(
          onTap: () => move(index),
          child: new Tile(imageURL: widget.url, alignment: a).croppedImageTile(1.0/widget.n),
        )
        );}
      )),
      
    );
  }

  void move(int tileIndex) {

  }


  
}