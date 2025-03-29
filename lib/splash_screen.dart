import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Fontos a SystemChrome importálása

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Átlátszó státuszsáv beállítása, de a navigációs sáv nem változik
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Státuszsáv átlátszó
      systemNavigationBarColor:
          Color(0xFFEBFFEE), // Rendszer navigációs sáv színe marad
      systemNavigationBarIconBrightness: Brightness.dark, // Ikonok színe sötét
    ));

    // 3 másodperc várakozás után átirányítunk a következő képernyőre
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBFFEE),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/karcagapp_logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 40),

              // Töltőcsík lekerekítése
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10), // Lekerekített háttér
                    color: Color.fromARGB(255, 138, 186, 144).withOpacity(0.3),
                  ),
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 53, 110, 55)),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/seelk.png',
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
