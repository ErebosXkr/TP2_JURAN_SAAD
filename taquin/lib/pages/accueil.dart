import 'package:flutter/material.dart';
import 'package:taquin/pages/exo7.dart';
import 'package:taquin/pages/pageTaquin.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _selectedDifficulty = 3; // Variable pour stocker le niveau de difficulté
  String url = "https://picsum.photos/1024";

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
          
            Image.network(
              url, // Remplacez par le chemin de la bonne image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // Boutons de sélection de niveau de difficulté
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 3 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Débutant'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 4;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 4 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Intermédiaire'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 5;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 5 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Avancé'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 6;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 6 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Expérimenté'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bouton "Jouer"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => Exo7(difficulty: _selectedDifficulty)),
                  MaterialPageRoute(builder: (context) => PageTaquin(_selectedDifficulty, url)),
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