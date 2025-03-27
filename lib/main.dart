import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/widgets/disputa_row.dart';
import 'package:pedrapapeltesoura/widgets/opcoes_row.dart';
import 'package:pedrapapeltesoura/widgets/placar_row.dart';
import 'package:pedrapapeltesoura/widgets/secao_titulo.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<int> options = [1, 2, 3];
  int _currentUserOption = 1;
  int _currentCpuOption = 1;
  int _userScore = 0;
  int _cpuScore = 0;
  int _ties = 0;
  // Had problems with this set to late after using into a custom widget, usei uma String vazia
  String _lastResult = '';

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
      _lastResult = 'user';
    } else if (_currentUserOption == _currentCpuOption) {
      _ties++;
      _lastResult = 'tie';
    } else {
      _cpuScore++;
      _lastResult = 'cpu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.grey)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Pedra, Papel, Tesoura')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SecaoTitulo(text: 'Disputa'),
            DisputaRow(
              currentUser: _currentUserOption,
              last: _lastResult,
              currentCpu: _currentCpuOption,
            ),
            SecaoTitulo(text: 'Placar'),
            PlacarRow(userScore: _userScore, ties: _ties, cpuScore: _cpuScore),
            SecaoTitulo(text: 'Opções'),
            OpcoesRow(options: options, play: play),
          ],
        ),
      ),
    );
  }
}
