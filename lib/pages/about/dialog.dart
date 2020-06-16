import 'package:jogo_do_quinze/links.dart';
import 'package:jogo_do_quinze/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 24);

    Padding HorizontalPadding(Widget child) {
      return Padding(
        padding: padding,
        child: child,
      );
    }

    return SimpleDialog(
      title: Text('Sobre'),
      children: <Widget>[
        HorizontalPadding(const Text(
            'O jogo do 15 é um quebra-cabeças de quinze peças, composto com quinze quadrados que trocam de lugar,'
            ' todos gravados com números, letras ou figuras. O objetivo é arranjar as peças em ordem, da esquerda para a direita, de cima a baixo.'
            ' Nesta vesão você pode arranjar alem de quinze, 24 e 35 itens.')),
        const SizedBox(height: 8),
        HorizontalPadding(const Text(
            'Você pode mover os itens tocando neles ou arrastando.')),
        const SizedBox(height: 8),
        HorizontalPadding(const Text(
            'Este jogo é gratuito e sempre será. Aproveite e divirta-se.')),
        const SizedBox(height: 24),
        ListTile(
          leading: Icon(Icons.close, size: 24),
          contentPadding: padding,
          title: const Text('Fechar'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
