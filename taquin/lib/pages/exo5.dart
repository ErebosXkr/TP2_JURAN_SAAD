import 'package:flutter/material.dart';
import 'package:taquin/widgets/taquin.dart';

class Exo5 extends StatelessWidget {
  const Exo5();

  @override
  Widget build(BuildContext context) {

  int width = (MediaQuery.sizeOf(context).width - 100).toInt();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),

      body: Center(
        child: Taquin(width, 4),
      )

    );
  }

  
}