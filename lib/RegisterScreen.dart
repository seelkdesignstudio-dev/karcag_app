import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _isScrolled = false;
  bool _termsAccepted = false;
  String? _helperText; // A dinamikusan változó súgó szöveg

  void _showHelperText(String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white), // Info ikon
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF024731), // Zöld háttér
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBFFEE),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _isScrolled = notification.metrics.pixels > 20;
            });
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFFEBFFEE),
              elevation: 0,
              pinned: true,
              floating: false,
              expandedHeight: 60,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF024731)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: _isScrolled
                  ? Text(
                      'Karcag ID',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF024731),
                      ),
                    )
                  : null,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'Karcag ID létrehozása',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF024731),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hozd létre személyes fiókod az applikáció használatához',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF024731),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Google login button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          side: const BorderSide(color: Color(0xFF024731)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/google.png',
                                  width: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Létrehozás Google-fiókkal',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF024731),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Facebook login button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          side: const BorderSide(color: Color(0xFF024731)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/facebook.png',
                                  width: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Létrehozás Facebook-fiókkal',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF024731),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Emailes regisztráció szekció
                    Text(
                      'Fiók létrehozása manuálisan:',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF024731),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildTextField('Teljes név', withHelpIcon: true),
                    const SizedBox(height: 12),
                    _buildTextField('Becenév', withHelpIcon: true),
                    const SizedBox(height: 12),
                    _buildTextField('Email cím'),
                    const SizedBox(height: 12),
                    _buildPasswordField('Jelszó', isPassword: true),
                    const SizedBox(height: 12),

                    // Jelszó újra mező
                    _buildPasswordField('Jelszó újra', isPassword: false),
                    const SizedBox(height: 12),

                    // Checkbox a személyes adatok kezeléséhez
                    Row(
                      children: [
                        Checkbox(
                          value: _termsAccepted,
                          onChanged: (value) {
                            setState(() {
                              _termsAccepted = value!;
                            });
                          },
                          activeColor: const Color(0xFF024731), // Zöld szín
                        ),
                        Expanded(
                          child: Text(
                            'Hozzájárulok személyes adataim kezeléséhez',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF024731),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Fiók létrehozása gomb
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward,
                          size: 20, color: Colors.white), // Fehér nyíl
                      label: Text(
                        'Fiók létrehozása',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF024731),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 24), // Padding a gomb körül
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {bool obscureText = false,
      Widget? suffixIcon,
      bool withHelpIcon = false}) {
    return TextField(
      obscureText: obscureText,
      cursorColor: const Color(0xFF024731), // Zöld kurzor
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color(0xFF024731)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF024731)), // Zöld keret
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF024731)), // Zöld keret
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
              color: Color(0xFF024731)), // Zöld keret inaktív állapotban is
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: const Color(0xFF024731),
              width: 2), // Zöld színű, ha fókuszban van
        ),
        suffixIcon: suffixIcon,
        prefixIcon: withHelpIcon
            ? IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: const Color(0xFF024731),
                ),
                onPressed: () {
                  if (label == 'Teljes név') {
                    _showHelperText(
                        'Kérjük, add meg a teljes neved, hogy a fiókodat biztonságosan kezelhessük és személyre szabott szolgáltatásokat nyújthassunk.');
                  } else if (label == 'Becenév') {
                    _showHelperText(
                        'A beceneved segít abban, hogy a rendszer barátságosabban szólhasson hozzád.');
                  }
                },
              )
            : null,
      ),
    );
  }

  Widget _buildPasswordField(String label, {required bool isPassword}) {
    return TextField(
      obscureText: isPassword ? !_showPassword : !_showConfirmPassword,
      cursorColor: const Color(0xFF024731),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color(0xFF024731)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF024731)), // Zöld keret
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF024731)), // Zöld keret
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
              color: Color(0xFF024731)), // Zöld keret inaktív állapotban is
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: const Color(0xFF024731), width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPassword
                ? (_showPassword ? Icons.visibility : Icons.visibility_off)
                : (_showConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
            color: const Color(0xFF024731),
          ),
          onPressed: () {
            setState(() {
              if (isPassword) {
                _showPassword = !_showPassword;
              } else {
                _showConfirmPassword = !_showConfirmPassword;
              }
            });
          },
        ),
      ),
    );
  }
}
