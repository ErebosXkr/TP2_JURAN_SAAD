import 'package:flutter/material.dart';
import 'package:taquin/pages/pageTaquin.dart';

class Accueil extends StatefulWidget {
  static GlobalKey globalKey = GlobalKey();

  Accueil(): super(key: globalKey);

  @override
  AccueilState createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  int _selectedDifficulty = 2; // Variable pour stocker l'état du switch
  static String url = "https://picsum.photos/1024";

  void _changeImage() {
    setState(() {
      url = "https://picsum.photos/1024?random=${DateTime.now().millisecondsSinceEpoch}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image de prévisualisation du jeu
            Image.network(
              url, // Remplacez par le chemin de la bonne image
              width: 300,
              height: 300,
            ),
            // Bonton renew
            ElevatedButton(
              onPressed: _changeImage,
              child: Icon(
                Icons.autorenew
                ),
            ),
            const SizedBox(height: 50),
            // Boutons de sélection de niveau de difficulté
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 2 ? const Color.fromARGB(255, 33, 224, 39) : const Color.fromARGB(255, 214, 214, 214),
                  ),
                  child: const Text('2x2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 3 ? const Color.fromARGB(255, 220, 213, 0) : const Color.fromARGB(255, 214, 214, 214),
                  ),
                  child: const Text('3x3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 4;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 4 ? const Color.fromARGB(255, 243, 159, 33) : const Color.fromARGB(255, 214, 214, 214),
                  ),
                  child: const Text('4x4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDifficulty = 5;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDifficulty == 5 ? const Color.fromARGB(255, 227, 21, 21) : const Color.fromARGB(255, 214, 214, 214),
                  ),
                  child: const Text('5x5'),
                ),
              ],
            ),
            const SizedBox(height: 100),
            // Boutons "Jouer"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageTaquin(_selectedDifficulty, url)),
                );
              },
              child: const Text('Jouer', style: TextStyle(fontSize: 40),),
            ),
          ],
        ),
      ),
    );
  }
}