import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/widgets/disputa_imagem.dart';
import 'package:pedrapapeltesoura/widgets/secao_titulo.dart';

class DisputaRow extends StatelessWidget {
  const DisputaRow({
    super.key,
    required this.currentUser,
    required this.last,
    required this.currentCpu,
  });
  final int currentUser;
  final int currentCpu;
  final String last;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DisputaImagem(lastResult: last, current: currentUser, owner: 'user'),
        // Image(image: AssetImage('assets/images/papel.png'), width: 100),
        SecaoTitulo(text: 'VS'),
        DisputaImagem(lastResult: last, current: currentCpu, owner: 'cpu'),
      ],
    );
  }
}
