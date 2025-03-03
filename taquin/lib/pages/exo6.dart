import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = math.Random();

class Tile {
  Color color;

  Tile(this.color);
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;
  final VoidCallback onTap;

  TileWidget(this.tile, {required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: coloredBox(),
    );
  }

  Widget coloredBox() {
    return Container(
      decoration: BoxDecoration(
        color: tile.color,
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<List<Tile>> tiles = List.generate(
    4,
    (i) => List.generate(4, (j) => Tile(Colors.blue)),
  );

  @override
  void initState() {
    super.initState();
    // Change the color of one random tile
    int randomRow = random.nextInt(4);
    int randomCol = random.nextInt(4);
    tiles[randomRow][randomCol] = Tile(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          int row = index ~/ 4;
          int col = index % 4;
          return TileWidget(
            tiles[row][col],
            onTap: () => swapTiles(row, col),
          );
        },
      ),
    );
  }

  void swapTiles(int row, int col) {
    setState(() {
      if (row > 0 && tiles[row - 1][col].color == Colors.red) {
        // Swap with top tile
        Tile temp = tiles[row][col];
        tiles[row][col] = tiles[row - 1][col];
        tiles[row - 1][col] = temp;
      } else if (row < 3 && tiles[row + 1][col].color == Colors.red) {
        // Swap with bottom tile
        Tile temp = tiles[row][col];
        tiles[row][col] = tiles[row + 1][col];
        tiles[row + 1][col] = temp;
      } else if (col > 0 && tiles[row][col - 1].color == Colors.red) {
        // Swap with left tile
        Tile temp = tiles[row][col];
        tiles[row][col] = tiles[row][col - 1];
        tiles[row][col - 1] = temp;
      } else if (col < 3 && tiles[row][col + 1].color == Colors.red) {
        // Swap with right tile
        Tile temp = tiles[row][col];
        tiles[row][col] = tiles[row][col + 1];
        tiles[row][col + 1] = temp;
      }
    });
  }
}