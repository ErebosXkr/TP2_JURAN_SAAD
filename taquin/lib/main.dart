import 'package:flutter/material.dart';
import 'package:taquin/pages/accueil.dart';
import 'package:taquin/pages/home.dart'; //page des exercices
import 'package:taquin/pages/about.dart';
import 'package:taquin/pages/exo7.dart'; //en attendant d'avoir la page taquin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const Accueil(),
    const Home(), // à renommer exercices à terme
    const About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Exercices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'A propos',
          ),
        ],
      ),
    );
  }
}