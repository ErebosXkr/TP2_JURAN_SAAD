import 'package:flutter/material.dart';
import 'package:taquin/widgets/taquin.dart';

class PageTaquin extends StatelessWidget {

  final int size;
  final String url;
  
  const PageTaquin(this.size, this.url, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Taquin'),
        centerTitle: true,
      ),

      body: Center(
        child: Taquin(500, size, url: url, playable: true, shuffled: true, key: UniqueKey()),
      ),

    );
  }

}