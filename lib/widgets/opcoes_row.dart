import 'package:flutter/material.dart';

class OpcoesRow extends StatelessWidget {
  const OpcoesRow({super.key, required this.options, required this.play});

  final List<int> options;
  final void Function(int) play;
  final String assetPath = 'assets/images';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
