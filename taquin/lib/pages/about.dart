import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A Propos',
          style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor, // Définir la couleur de l'en-tête en bleu
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Taquin réalisé par Paul Juran et Léa-Line SAAD '
            'Cette application de taquin est un jeu de puzzle classique où le joueur doit réorganiser les tuiles pour former une image ou une séquence correcte. '
            'Profitez de différents niveaux de difficulté (2*2, 3*3, 4*4 ou 5*5) et de diverses images à reconstituer. Bonne chance et amusez-vous bien !',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}