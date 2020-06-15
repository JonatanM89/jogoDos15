import 'package:jogo_do_quinze/models/result.dart';
import 'package:jogo_do_quinze/links.dart';
import 'package:jogo_do_quinze/play_games.dart';
import 'package:jogo_do_quinze/pages/game/format.dart';
import 'package:flutter/material.dart';
//import 'package:share/share.dart';

class GameVictoryDialog extends StatelessWidget {
  final Result result;

  final String Function(int) timeFormatter;

  GameVictoryDialog({
    @required this.result,
    this.timeFormatter: formatElapsedTime,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormatted = timeFormatter(result.time);
    final actions = <Widget>[
      new FlatButton(
        child: new Text("Compartilhar"),
        onPressed: () {
          /* Share.share("I have solved the Game of Fifteen's "
              "${result.size}x${result.size} puzzle in $timeFormatted "
              "with just ${result.steps} steps! Check it out: $URL_REPOSITORY");*/
        },
      ),
      new FlatButton(
        child: new Text("Fechar"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];

    if (PlayGamesContainer.of(context).isSupported) {
      actions.insert(
        0,
        new FlatButton(
          child: new Text("Leaderboard"),
          onPressed: () {
            final playGames = PlayGamesContainer.of(context);
            playGames.showLeaderboard(
              key: PlayGames.getLeaderboardOfSize(result.size),
            );
          },
        ),
      );
    }

    return AlertDialog(
      title: Center(
        child: Text(
          "Parabéns!",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Você completou o jogo ${result.size}x${result.size}"),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Tempo:',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    timeFormatted,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Theme.of(context).textTheme.body1.color,
                        ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Jogadas:',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '${result.steps}',
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Theme.of(context).textTheme.body1.color,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: actions,
    );
  }
}
