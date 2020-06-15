import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reorderables/reorderables.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool _isStart = true;
  String titleBotom = ' Novo jogo';
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);
  double width = 100.0, height = 100.0;
  Offset position = Offset.zero;
  final double _iconSize = 90;
  List<Widget> _tiles;

  List<Widget> movableItems = [];

  _getContainer(String number, Color color) {
    return InkWell(
      onTap: () => {print('teste')},
      child: Container(
        height: 70,
        width: 70,
        color: color,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _loadItens() {
    setState(() {
      _tiles = <Widget>[
        _getContainer('1', Colors.blue),
        _getContainer('2', Colors.blue),
        _getContainer('3', Colors.blue),
        _getContainer('4', Colors.blue),
        _getContainer('5', Colors.green),
        _getContainer('6', Colors.green),
        _getContainer('7', Colors.green),
        _getContainer('8', Colors.green),
        _getContainer('9', Colors.red),
        _getContainer('10', Colors.red),
        _getContainer('11', Colors.red),
        _getContainer('12', Colors.red),
        _getContainer('13', Colors.white),
        _getContainer('14', Colors.white),
        _getContainer('15', Colors.white),
        _getContainer('', Colors.grey),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadItens();
  }

  _game() {
    return Container(
      height: 400,
      width: 320,
      child: Stack(
        children: movableItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 244, 1),
      body: _renderHome(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startStopButtonPressed,
        icon: Icon(FontAwesomeIcons.gamepad,
            color: Color.fromRGBO(47, 46, 46, 1)),
        label: Text(
          titleBotom,
          style: TextStyle(color: Color.fromRGBO(47, 46, 46, 1)),
        ),
        backgroundColor: Color.fromRGBO(255, 182, 0, 1),
      ),
    );
  }

  _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  _setStopwatchText() {
    _stopwatchText = _stopWatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.reset();
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.reset();
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  _renderHome() {
    return Column(
      children: <Widget>[
        Container(
          height: 140,
          color: Color.fromRGBO(255, 182, 0, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  'Tempo',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(47, 46, 46, 1)),
                ),
              ),
              Center(
                child: Text(
                  _stopwatchText,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromRGBO(47, 46, 46, 1)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: <Widget>[],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _spaceGame()
      ],
    );
  }

  _spaceGame() {
    _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        needsLongPressDraggable: false,
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: wrap,
          padding: EdgeInsets.all(5.0),
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
