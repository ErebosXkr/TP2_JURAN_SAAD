

import 'package:flutter/material.dart';

// marche pas de fou
class Taquin extends StatefulWidget{

  final int n;
  final int size;
  late String url;
  Taquin(this.size, this.n, {super.key}) {
    url = "https://picsum.photos/512/1024";
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
      width: widget.size as double,
      height: widget.size as double,
      child: GridView.count(
      crossAxisCount: widget.n,
      
      children: List.generate(widget.n*widget.n, (index) => SizedBox(
        width: widget.size / widget.n,
        height: widget.size / widget.n,
        child: Material(
          color: tiles![index] == widget.n*widget.n-1 ? Colors.white : Color.fromARGB(255,tiles![index]*10,tiles![index]*10,tiles![index]*10),
          child: InkWell(
            onTap: () {move(index);},
          ),
        ),
      )),
      
      ),
    );
  }

  void move(int tileIndex) {
    int size = widget.n;
    int hole = widget.n*widget.n-1;
    
    if(tileIndex>0 && tiles![tileIndex-1] == hole) {
      setState(() {
        int temp = tiles![tileIndex];
        tiles![tileIndex] = tiles![tileIndex-1];
        tiles![tileIndex-1] = temp;
      });
    }
    if(tileIndex<hole && tiles![tileIndex-1] == hole) {
      setState(() {
        int temp = tiles![tileIndex];
        tiles![tileIndex] = tiles![tileIndex+1];
        tiles![tileIndex+1] = temp;
      });
    }

  }


  
}