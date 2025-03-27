import 'package:flutter/material.dart';

class DisputaImagem extends StatelessWidget {
  const DisputaImagem({
    super.key,
    required this.lastResult,
    required this.current,
    required this.owner,
  });
  final String lastResult;
  final int current;
  final String owner;
  final String assetPath = 'assets/images';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color:
              lastResult == owner
                  ? Colors.green
                  : lastResult == 'tie'
                  ? Colors.orange
                  : Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(image: AssetImage('$assetPath/$current.png'), width: 100),
    );
  }
}
