import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facebook/dados/dados.dart';
import 'package:clone_facebook/models/modelos.dart';
import 'package:clone_facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

import 'imagem_perfil.dart';

class AreaStory extends StatelessWidget {
  final Usuario usuario;
  final List<Story> story;

  const AreaStory({
    Key? key,
    required this.usuario,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + storys.length,
        itemBuilder: (context, index) {
          // card zero
          if (index == 0) {
            Story storyUser = Story(
              usuario: usuarioAtual,
              urlImagem: usuarioAtual.urlImagem,
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CardStory(
                addStory: true,
                story: storyUser,
              ),
            );
          }
          // card zero
          Story story = storys[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CardStory(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class CardStory extends StatelessWidget {
  final Story story;
  final bool addStory;
  const CardStory({
    Key? key,
    required this.story,
    this.addStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeStory,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add,
                    ),
                    color: PaletaCores.azulFacebook,
                  ),
                )
              : ImagemPerfil(
                  urlImagem: story.usuario.urlImagem,
                  foiVisualizado: story.foiVisualizado,
                ),
        ),
        Positioned(
            width: 90,
            bottom: 8,
            left: 8,
            child: Text(
              addStory ? "Criar Story" : story.usuario.nome,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
