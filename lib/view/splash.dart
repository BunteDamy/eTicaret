import 'package:flutter/material.dart';
import 'package:proje/assets.dart';
import 'package:proje/constant/constant.dart';
import 'package:proje/view/base_scaffold.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseScaffold()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.darkWhite,
      body: Center(
        child: Image.asset(Assets.images.imSplashPNG), 
      ),
    );
  }
}
