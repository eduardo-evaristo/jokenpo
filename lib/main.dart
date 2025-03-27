import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/placar_column.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Does not work work for files located in assets, gotta use Image.asset or AssetImage
  List<int> options = [1, 2, 3];
  final String assetPath = 'assets/images';
  int _currentUserOption = 1;
  int _currentCpuOption = 1;

  void _cpuSelectsOption() {
    setState(() {
      _currentCpuOption = Random().nextInt(3) + 1;
    });
  }

  void _userSelectsOption(int option) {
    setState(() {
      _currentUserOption = option;
    });
  }

  void play(int userOption) {
    _userSelectsOption(userOption);
    _cpuSelectsOption();
  }

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
                Image(
                  image: AssetImage('$assetPath/$_currentUserOption.png'),
                  width: 100,
                ),
                // Image(image: AssetImage('assets/images/papel.png'), width: 100),
                Text('VS'),
                Image(
                  image: AssetImage('$assetPath/$_currentCpuOption.png'),
                  width: 100,
                ),
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
              children:
                  options
                      .map<Widget>(
                        (int i) => GestureDetector(
                          onTap: () => play(i),
                          child: Image(
                            image: AssetImage('$assetPath/$i.png'),
                            width: 100,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
