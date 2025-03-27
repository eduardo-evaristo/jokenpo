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
  int _userScore = 0;
  int _cpuScore = 0;
  int _ties = 0;

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
    _evaluate();
  }

  void _evaluate() {
    if ((_currentUserOption == 1 && // Paper beats Rock
            _currentCpuOption == 3) ||
        (_currentUserOption == 2 &&
            _currentCpuOption == 1) || // Scissors beats Paper
        (_currentUserOption == 3 && _currentCpuOption == 2)) {
      // Rock beats Scissors
      _userScore++;
    } else if (_currentUserOption == _currentCpuOption) {
      _ties++;
    } else {
      _cpuScore++;
    }
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
                PlacarColumn(text: 'Você', score: _userScore),
                PlacarColumn(text: 'Empate', score: _ties),
                PlacarColumn(text: 'Máquina', score: _cpuScore),
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
