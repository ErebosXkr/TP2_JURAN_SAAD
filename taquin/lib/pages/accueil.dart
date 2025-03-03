import 'package:flutter/material.dart';
import 'package:taquin/pages/exo7.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        backgroundColor: Colors.blue, // Définir la couleur de l'en-tête en bleu
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image de prévisualisation du jeu
            Image.asset(
              'assets/preview_image.png', // Remplacez par le chemin de votre image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // Bouton "Jouer"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Exo7()),
                );
              },
              child: const Text('Jouer'),
            ),
          ],
        ),
      ),
    );
  }
}