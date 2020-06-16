import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Widget shows the current steps counter of
/// a game.
class GameStepsWidget extends StatefulWidget {
  final int steps;

  GameStepsWidget({@required this.steps});

  @override
  _GameStepsState createState() => _GameStepsState();
}

class _GameStepsState extends State<GameStepsWidget> {
  @override
  Widget build(BuildContext context) {
    String jogadas =
        widget.steps == 0 ? 'Nenhuma jogada' : '${widget.steps} jogadas';
    return Text(
      '${jogadas}',
      style: Theme.of(context).textTheme.subtitle,
    );
  }
}
