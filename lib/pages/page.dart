import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_do_quinze/models/result.dart';
import 'package:jogo_do_quinze/play_games.dart';
import 'game/material/page.dart';
import 'game/material/victory.dart';
import 'game/presenter/main.dart';
import 'package:firebase_admob/firebase_admob.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    contentUrl: 'https://1code.com.br',
    childDirected: false,
    testDevices: <String>[],
  );

  BannerAd myBanner;
  int clicks = 0;

  void startBanner() {
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-4050004605588503/3312554973',
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened) {
          // MobileAdEvent.opened
          // MobileAdEvent.clicked
          // MobileAdEvent.closed
          // MobileAdEvent.failedToLoad
          // MobileAdEvent.impression
          // MobileAdEvent.leftApplication
        }
        print("BannerAd event is $event");
      },
    );
  }

  void displayBanner() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.top,
      );
  }

  @override
  void dispose() {
    myBanner?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-4050004605588503~5938718314");

    startBanner();
    displayBanner();
  }

  @override
  Widget build(BuildContext context) {
    final rootWidget = _buildRoot(context);
    return GamePresenterWidget(
      child: rootWidget,
      onSolve: (result) {
        _submitResult(context, result);
        _showVictoryDialog(context, result);
      },
    );
  }

  Widget _buildRoot(BuildContext context) {
    return GameMaterialPage();
  }

  void _showVictoryDialog(BuildContext context, Result result) {
    showDialog(
      context: context,
      builder: (context) => GameVictoryDialog(result: result),
    );
  }

  void _submitResult(BuildContext context, Result result) {
    final playGames = PlayGamesContainer.of(context);
    playGames.submitScore(
      key: PlayGames.getLeaderboardOfSize(result.size),
      time: result.time,
    );
  }
}
