import 'dart:async';

import 'package:bubbleup/screens/OptionScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return OptionScreen();
            })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff6a6be9),
        body: Image.asset(
          "assets/img/splash.png",
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
