import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Animáció beállítása
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    );

    _controller!.forward();

    // 3 másodperc után navigálás a welcome screen-re
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBFFEE),
      body: Center(
        child: FadeTransition(
          opacity: _animation!, // Alkalmazzuk az animációt
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/karcagapp_logo.png',
                width: 350,
                height: 350,
              ), // A logó animációval jelenik meg
              SizedBox(height: 20), // Néhány hely a logó és a szöveg között
              Text(
                'Betöltés...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF024731),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
