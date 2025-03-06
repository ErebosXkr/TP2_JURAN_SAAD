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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Taquin',
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Mettre la flèche de retour en blanc
        ),
      ),
      body: Center(
        child: Taquin(
          400,
          size,
          url: url,
          playable: true,
          shuffled: true,
          key: UniqueKey(),
        ),
      ),
    );
  }
}