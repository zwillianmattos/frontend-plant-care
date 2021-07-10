import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            builder: (BuildContext context, double? scale, Widget? child) {
              return Transform.scale(scale: scale!, child: child);
            },
            duration: Duration(milliseconds: 600),
            tween: _scaleTween,
            child: Image.asset(
              'images/logo.png',
              scale: 2,
            ),
            onEnd: () async {
              Modular.to.pushReplacementNamed('/');
              
            }),
      ),
    );
  }
}
