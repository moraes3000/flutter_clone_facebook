import 'package:clone_facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmabixo;

  const NavegacaoAbas({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
    this.indicadorEmabixo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: indicadorEmabixo
              ? const Border(
                  bottom: BorderSide(color: PaletaCores.azulFacebook, width: 3),
                )
              : const Border(
                  top: BorderSide(color: PaletaCores.azulFacebook, width: 3),
                ),
        ),
        tabs: icones
            .asMap()
            .map((index, icone) {
              return MapEntry(
                  index,
                  Tab(
                    icon: Icon(
                      icone,
                      color: indiceAbaSelecionada == index
                          ? PaletaCores.azulFacebook
                          : Colors.black54,
                      size: 30,
                    ),
                  ));
            })
            .values
            .toList());
  }
}
