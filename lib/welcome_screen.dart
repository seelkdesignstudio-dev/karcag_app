import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importáljuk a szükséges csomagot
import 'package:google_fonts/google_fonts.dart';
import 'package:karcag_app/RegisterScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Beállítjuk a státuszsáv átlátszóságát
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Átlátszó státuszsáv
      statusBarIconBrightness: Brightness.dark, // A státuszsáv ikonok színe
    ));

    // Animáció létrehozása (FadeIn)
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // 1 másodperces animáció
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeIn),
    );

    // Az animáció elindítása
    _controller?.forward();
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
      body: SafeArea(
        child: FadeTransition(
          opacity: _animation!, // A fade in animáció alkalmazása
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  'Üdvözlünk a KarcagAPP-ban!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF024731),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Elérheted a város legfontosabb információit, egyetlen alkalmazásban.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF024731),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Hírek, események, szolgáltatások.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF024731),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Hozd létre saját Karcag ID-det (fiókod), vagy lépj be meglévő fiókoddal.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF024731),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF024731),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ).copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Color(
                                  0xFF016F1B); // Hover szín (sötét zöld)
                            }
                            return Color(0xFF024731); // Alap szín
                          },
                        ),
                      ),
                      child: Text(
                        'Karcag ID létrehozása',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF024731)),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ).copyWith(
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return BorderSide(
                                  color: Color(
                                      0xFF016F1B)); // Hover szín (sötét zöld)
                            }
                            return BorderSide(
                                color: Color(0xFF024731)); // Alap szín
                          },
                        ),
                      ),
                      child: Text(
                        'Bejelentkezés meglévő fiókkal',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF024731),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
