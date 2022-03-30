// ignore_for_file: prefer_final_fields

import 'package:clone_facebook/dados/dados.dart';
import 'package:clone_facebook/telas/home.dart';
import 'package:clone_facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../components/navegacao_abas.dart';
import '../components/navegacao_abas_desk.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
    const Scaffold(
      backgroundColor: Colors.orange,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavegacaoAbasDesk(
                    usuario: usuarioAtual,
                    icones: _icones,
                    indiceAbaSelecionada: _indiceAbaSelecionada,
                    onTap: (index) {
                      setState(() {
                        _indiceAbaSelecionada = index;
                      });
                    }),
                preferredSize: Size(tamanho.width, 100))
            : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                icones: _icones,
                indiceAbaSelecionada: _indiceAbaSelecionada,
                onTap: (index) {
                  setState(() {
                    _indiceAbaSelecionada = index;
                  });
                }),
      ),
    );
  }
}
