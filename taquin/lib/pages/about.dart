import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A propos'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Cette application de taquin est un jeu de puzzle classique où le joueur doit réorganiser les tuiles pour former une image ou une séquence correcte. '
            'Le jeu est conçu pour être à la fois amusant et éducatif, aidant les joueurs à améliorer leurs compétences en résolution de problèmes et leur logique. '
            'Profitez de différents niveaux de difficulté et de diverses images à reconstituer. Bonne chance et amusez-vous bien !',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}