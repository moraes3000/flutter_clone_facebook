import 'package:clone_facebook/models/modelos.dart';
import 'package:flutter/material.dart';

import 'botao_imagem_perfil.dart';

class ListContatos extends StatelessWidget {
  final List<Usuario> usuarios;

  const ListContatos({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: Text(
              'Contatos',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_outlined)),
        ]),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            Usuario usuario = usuarios[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BotaoImagemPerfil(
                usuario: usuario,
                onTap: () {},
              ),
            );
          },
        ))
      ],
    );
  }
}
