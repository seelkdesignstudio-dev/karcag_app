import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Color _elevatedButtonColor = Color(0xFF024731);
  Color _textButtonColor = Color(0xFF024731);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBFFEE),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Szélesebb padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Középre igazítás
            crossAxisAlignment: CrossAxisAlignment.center, // Középre igazítás
            children: [
              Text(
                'Üdvözlünk a KarcagAPP-ban!',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF024731),
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 40), // Több hely a szövegek között
              Text(
                'A város egy érintéssel közelebb.\n\nFedezd fel Karcag legfontosabb híreit, eseményeit és szolgáltatásait egy helyen.',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF024731),
                ),
              ),
              SizedBox(height: 40), // Több hely a gombok előtt
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Karcag ID létrehozása
                    },
                    onHover: (value) {
                      setState(() {
                        _elevatedButtonColor =
                            value ? Color(0xFF026040) : Color(0xFF024731);
                      });
                    },
                    child: Text(
                      'Karcag ID létrehozása',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _elevatedButtonColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 5, // Árnyék hozzáadása
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Bejelentkezés meglévő fiókkal
                    },
                    onHover: (value) {
                      setState(() {
                        _textButtonColor =
                            value ? Color(0xFF026040) : Color(0xFF024731);
                      });
                    },
                    child: Text(
                      'Bejelentkezés meglévő fiókkal',
                      style: TextStyle(
                        color: _textButtonColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
