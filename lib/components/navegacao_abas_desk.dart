import 'package:clone_facebook/models/modelos.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../uteis/paleta_cores.dart';
import 'botao_circulo.dart';
import 'botao_imagem_perfil.dart';
import 'navegacao_abas.dart';

class NavegacaoAbasDesk extends StatelessWidget {
  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;

  const NavegacaoAbasDesk({
    Key? key,
    required this.icones,
    required this.usuario,
    required this.indiceAbaSelecionada,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(children: [
        const Expanded(
          child: Text(
            "FaceBook",
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
        ),
        Expanded(
          child: NavegacaoAbas(
            icones: icones,
            indiceAbaSelecionada: indiceAbaSelecionada,
            onTap: onTap,
            indicadorEmabixo: true,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BotaoImagemPerfil(
                usuario: usuario,
                onTap: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.search,
                iconTamanho: 30,
                onPress: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconTamanho: 30,
                onPress: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
