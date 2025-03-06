import 'dart:math';
import 'package:flutter/material.dart';
import 'package:taquin/pages/accueil.dart';
import 'package:taquin/pages/exo4.dart';

// ignore: must_be_immutable
class Taquin extends StatefulWidget {
  final int n;
  final int size;
  late String url;
  late bool playable;
  late bool shuffled;
  late Random random;

  Taquin(this.size, this.n, {super.key, String? url, bool? playable, bool? shuffled}) {
    this.url = url ?? "https://picsum.photos/1024";
    this.playable = playable ?? false;
    this.shuffled = shuffled ?? false;
    random = Random();
  }

  @override
  State<StatefulWidget> createState() {
    return TaquinState();
  }
}

class TaquinState extends State<Taquin> {
  List<int>? tiles;
  late List<int> actions;
  late List<Widget> tilesWidget;
  bool showNumbers = false;

  @override
  void initState() {
    super.initState();

    actions = List.empty(growable: true);
    tiles = List.generate(widget.n * widget.n, (index) => index);

    if (widget.shuffled) {
      shuffle(100 * widget.n * widget.n);
    }

    tilesWidget = generateList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.size.toDouble(),
          height: widget.size.toDouble(),
          child: GridView.count(
            crossAxisCount: widget.n,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            children: tilesWidget,
          ),
        ),
        const SizedBox(height: 20), // Ajout d'espace entre le taquin et le bouton "Auto Solve"
        ElevatedButton(
          onPressed: solve,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 214, 214, 214),
          ),
          child: const Text('Auto Solve!'),
        ),
        const SizedBox(height: 20), // Ajout d'espace entre le bouton "Auto Solve" et la checkbox
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: showNumbers,
              onChanged: (value) {
                setState(() {
                  showNumbers = value!;
                  tilesWidget = generateList();
                });
              },
            ),
            const Text('Afficher les chiffres'),
          ],
        ),
      ],
    );
  }

  void move(int tileIndex) {
    if (!widget.playable) return;

    int size = widget.n;
    int targetId = size * size - 1;
    int x = tileIndex % size;
    int y = tileIndex ~/ size;

    if (x > 0 && tiles![y * size + x - 1] == targetId) {
      int tmp = tiles![y * size + x];
      tiles![y * size + x] = tiles![y * size + x - 1];
      tiles![y * size + x - 1] = tmp;
      actions.add(3);
    }

    if (x < size - 1 && tiles![y * size + x + 1] == targetId) {
      int tmp = tiles![y * size + x];
      tiles![y * size + x] = tiles![y * size + x + 1];
      tiles![y * size + x + 1] = tmp;
      actions.add(1);
    }

    if (y > 0 && tiles![(y - 1) * size + x] == targetId) {
      int tmp = tiles![y * size + x];
      tiles![y * size + x] = tiles![(y - 1) * size + x];
      tiles![(y - 1) * size + x] = tmp;
      actions.add(2);
    }

    if (y < size - 1 && tiles![(y + 1) * size + x] == targetId) {
      int tmp = tiles![y * size + x];
      tiles![y * size + x] = tiles![(y + 1) * size + x];
      tiles![(y + 1) * size + x] = tmp;
      actions.add(0);
    }

    setState(() {
      tilesWidget = generateList();
    });

    if (checkFinished()) {
      handleFinish();
    }
  }

  List<Widget> generateList() {
    return List.generate(widget.n * widget.n, (index) {
      int i = tiles![index] % widget.n;
      int j = tiles![index] ~/ widget.n;
      Alignment a = Alignment(i / (widget.n - 1) * 2 - 1, j / (widget.n - 1) * 2 - 1);

      return SizedBox(
        width: widget.size / widget.n,
        height: widget.size / widget.n,
        child: InkWell(
          onTap: () => move(index),
          child: tiles![index] != widget.n * widget.n - 1
              ? Stack(
                  children: [
                    Tile(imageURL: widget.url, alignment: a).croppedImageTile(1.0 / widget.n),
                    if (showNumbers)
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(127, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    if (showNumbers)
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${tiles![index]}",
                          style: const TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                  ],
                )
              : const ColoredBox(color: Colors.white),
        ),
      );
    });
  }

  void shuffle(int n) {
    int x = widget.n - 1;
    int y = widget.n - 1;
    int size = widget.n;

    for (int i = 0; i < n; i++) {
      int action = widget.random.nextInt(4);

      // bas
      if (action == 0 && y > 0) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![(y - 1) * size + x];
        tiles![(y - 1) * size + x] = temp;
        y--;
        actions.add(action);
      }

      // gauche
      if (action == 1 && x > 0) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![y * size + x - 1];
        tiles![y * size + x - 1] = temp;
        x--;
        actions.add(action);
      }

      // haut
      if (action == 2 && y < size - 1) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![(y + 1) * size + x];
        tiles![(y + 1) * size + x] = temp;
        y++;
        actions.add(action);
      }

      // droite
      if (action == 3 && x < size - 1) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![y * size + x + 1];
        tiles![y * size + x + 1] = temp;
        x++;
        actions.add(action);
      }
    }
  }

  void solve() {
    fatTrim();

    for (int i = 0; i < actions.length; i++) {
      int move = actions[actions.length - 1 - i];

      int x = tiles!.indexOf(widget.n * widget.n - 1) % widget.n;
      int y = tiles!.indexOf(widget.n * widget.n - 1) ~/ widget.n;
      int size = widget.n;

      // haut
      if (move == 0) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![(y + 1) * size + x];
        tiles![(y + 1) * size + x] = temp;
        y++;
      }

      // droite
      if (move == 1) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![y * size + x + 1];
        tiles![y * size + x + 1] = temp;
        x++;
      }

      // bas
      if (move == 2) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![(y - 1) * size + x];
        tiles![(y - 1) * size + x] = temp;
        y--;
      }

      // gauche
      if (move == 3) {
        int temp = tiles![y * size + x];
        tiles![y * size + x] = tiles![y * size + x - 1];
        tiles![y * size + x - 1] = temp;
        x--;
      }

      List<Widget> state = generateList();
      Future.delayed(Duration(milliseconds: 10 * (i + 1))).then((m) {
        setState(() {
          tilesWidget = state;
        });
      });
    }

    Future.delayed(Duration(milliseconds: 10 * actions.length)).then((m) {
      handleFinish();
    });
  }

  void fatTrim() {
    bool check() {
      for (int i = 0; i < actions.length - 2; i++) {
        if (actions[i] - actions[i + 1] == 2 || actions[i] - actions[i + 1] == -2) {
          return true;
        }
      }
      return false;
    }

    while (check()) {
      int removePair = 0;
      for (int i = 0; i < actions.length - 2; i++) {
        if (actions[i] - actions[i + 1] == 2 || actions[i] - actions[i + 1] == -2) {
          removePair = i;
          break;
        }
      }
      actions.removeAt(removePair);
      actions.removeAt(removePair);
    }
  }

  bool checkFinished() {
    for (int i = 0; i < tiles!.length; i++) {
      if (i != tiles![i]) {
        return false;
      }
    }
    return true;
  }

  void handleFinish() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Vous avez gagné"),
        content: Text("Bravo !"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, "OK");
              Navigator.pop(context, "Retour Accueil");
              if (Accueil.globalKey.currentState != null) {
                Accueil.globalKey.currentState!.setState(() {
                  AccueilState.url = "https://picsum.photos/1024?random=${DateTime.now().millisecondsSinceEpoch}";
                });
              }
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}