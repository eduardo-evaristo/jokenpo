import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/placar_column.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // Does not work work for files located in assets, gotta use Image.asset or AssetImage
  //final File pedra = File('assets/images/pedra.png');

  // Avoiding repetition
  final String assetPath = 'assets/images';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text('Disputa'),
            Row(
              children: <Widget>[
                Image(image: AssetImage('$assetPath/pedra.png'), width: 100),
                // Image(image: AssetImage('assets/images/papel.png'), width: 100),
                Text('VS'),
                Image(image: AssetImage('$assetPath/tesoura.png'), width: 100),
              ],
            ),
            Text('Placar'),
            Row(
              children: <Widget>[
                PlacarColumn(text: 'Você'),
                PlacarColumn(text: 'Empate'),
                PlacarColumn(text: 'Máquina'),
              ],
            ),
            Text('Opções'),
            Row(
              children: [
                Image(image: AssetImage('$assetPath/pedra.png'), width: 100),
                Image(image: AssetImage('$assetPath/papel.png'), width: 100),
                Image(image: AssetImage('$assetPath/tesoura.png'), width: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
