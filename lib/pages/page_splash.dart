import 'package:flutter/material.dart';
import 'package:jogo_do_quinze/pages/page.dart';
import 'package:jogo_do_quinze/utils/nav.utils.dart';
import 'delayed_aimation.page.dart';
import 'package:quiver/async.dart';
import 'home.page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final int delayedAmount = 500;
  double _widthLogo = 280;
  double _widthLogo2 = 0;

  @override
  void initState() {
    super.initState();

    new CountdownTimer(new Duration(seconds: 3), new Duration(milliseconds: 60))
        .listen((data) {
      setState(() {
        _widthLogo = _widthLogo - 5;
      });
    }).onDone(() {
      setState(() {
        _widthLogo = _widthLogo - 5;
      });
    });

    Future future1 = Future.delayed(Duration(seconds: 5));

    Future.wait([future1]).then((List values) async {
      push(context, GamePage(), replace: true);
    });
  }

  _renderLogo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DelayedAimation(
              child: Image.asset(
                'assets/1code.png',
                width: _widthLogo,
              ),
              delay: delayedAmount + 50),
          SizedBox(
            height: 30,
          ),
          DelayedAimation(
              child: Text(
                '1Code',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              delay: delayedAmount + 200),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: Center(
        child: _renderLogo(),
      ),
    );
  }
}
