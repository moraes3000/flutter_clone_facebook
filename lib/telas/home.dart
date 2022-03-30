import 'package:clone_facebook/dados/dados.dart';
import 'package:clone_facebook/models/modelos.dart';
import 'package:clone_facebook/uteis/paleta_cores.dart';
import 'package:clone_facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../components/area_cria_postagem.dart';
import '../components/area_story.dart';
import '../components/botao_circulo.dart';
import '../components/cartao_postagem.dart';
import '../components/list_contatos.dart';
import '../components/list_opcao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivo(
        mobile: HomeMobile(scrollController: _scrollController),
        desktop: HomeDesktop(scrollController: _scrollController),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeMobile({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          // expandedHeight: 250,
          floating: true,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Text(
            "FaceBook",
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverToBoxAdapter(
          child: AreaCriaPostagem(usuario: usuarioAtual),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            bottom: 10,
            top: 5,
          ),
          sliver: SliverToBoxAdapter(
            child: AreaStory(
              usuario: usuarioAtual,
              story: storys,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            Postagem postagem = postagens[index];
            return CartaoPostagem(postagem: postagem);
          },
          childCount: postagens.length,
        ))
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: ListOpcao(usuarios: usuarioAtual),
        ),
        const Spacer(),
        Flexible(
          flex: 4,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 5,
                ),
                sliver: SliverToBoxAdapter(
                  child: AreaStory(
                    usuario: usuarioAtual,
                    story: storys,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AreaCriaPostagem(usuario: usuarioAtual),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Postagem postagem = postagens[index];
                  return CartaoPostagem(postagem: postagem);
                },
                childCount: postagens.length,
              ))
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: ListContatos(usuarios: usuariosOnline),
        ),
      ],
    );
  }
}
