import 'package:flutter/material.dart';
import 'package:taquin/pages/exo4.dart';
import 'package:taquin/pages/exo2.dart';
import 'package:taquin/pages/exo6.dart';
import 'package:taquin/pages/exo5.dart';
import 'package:taquin/pages/exo7.dart';

//à renommer en exercices
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("TP2", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Exo 2", style: TextStyle(color: Colors.black)),
            subtitle: const Text("Transformer une image"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageTransformer()),
              );
            },
          ),
          ListTile(
            title: const Text("Exo 4", style: TextStyle(color: Colors.black)),
            subtitle: const Text("Affichage d'une tuile (un morceau d'image)"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DisplayTileWidget()),
              );
            },
          ),
          ListTile(
            title: const Text("Exo 5", style: TextStyle(color: Colors.black)),
            subtitle: const Text("Génération du plateau de tuiles"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exo5()),
              );
            },
          ),
          ListTile(
            title: const Text("Exo 6", style: TextStyle(color: Colors.black)),
            subtitle: const Text("Animation d'une tuile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PositionedTiles()),
              );
            },
          ),
          ListTile(
            title: const Text("Exo 7", style: TextStyle(color: Colors.black)),
            subtitle: const Text("Jeu de taquin"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exo7()),
              );
            },
          ),
        ],
      ),
    );
  }
}