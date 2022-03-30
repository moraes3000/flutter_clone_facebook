import 'package:flutter/material.dart';

class BotaoCirculo extends StatelessWidget {
  final IconData icone;
  final double iconTamanho;
  final VoidCallback onPress;

  const BotaoCirculo({
    Key? key,
    required this.icone,
    required this.iconTamanho,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icone),
        iconSize: iconTamanho,
        color: Colors.black,
      ),
    );
  }
}
