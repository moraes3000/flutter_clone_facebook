import 'package:clone_facebook/components/botao_imagem_perfil.dart';
import 'package:clone_facebook/models/modelos.dart';
import 'package:clone_facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListOpcao extends StatelessWidget {
  final Usuario usuarios;

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulFacebook, 'Amigos'],
    [LineIcons.facebookMessenger, PaletaCores.azulFacebook, 'Messager'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, PaletaCores.azulFacebook, 'Grupos'],
  ];

  const ListOpcao({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 1 + _opcoes.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BotaoImagemPerfil(
              usuario: usuarios,
              onTap: () {},
            ),
          );
        }
        List item = _opcoes[index - 1];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Opcao(
              icone: item[0],
              cor: item[1],
              texto: item[2],
              onTap: () {},
            ));
      },
    );
  }
}

class Opcao extends StatelessWidget {
  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;

  const Opcao({
    Key? key,
    required this.icone,
    required this.cor,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icone,
          color: cor,
          size: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ]),
    );
  }
}
