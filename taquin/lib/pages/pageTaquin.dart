import 'package:flutter/material.dart';
import 'package:taquin/widgets/taquin.dart';

class PageTaquin extends StatelessWidget {
  final int size;
  final String url;
  final bool showNumbers;

  const PageTaquin(this.size, this.url, this.showNumbers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Taquin'),
        centerTitle: true,
      ),
      body: Center(
        child: Taquin(
          500,
          size,
          url: url,
          playable: true,
          shuffled: true,
          showNumbers: showNumbers,
          key: UniqueKey(),
        ),
      ),
    );
  }
}