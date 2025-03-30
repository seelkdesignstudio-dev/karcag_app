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

  void _showHelperText(String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 0,
              pinned: true,
              floating: false,
              expandedHeight: 60,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: theme.primaryColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: _isScrolled
                  ? Text(
                      'Karcag ID',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
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
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hozd létre személyes fiókod az applikáció használatához',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Google login button
                    _buildSocialButton('Létrehozás Google-fiókkal',
                        'assets/images/google.png'),

                    const SizedBox(height: 12),

                    // Facebook login button
                    _buildSocialButton('Létrehozás Facebook-kal',
                        'assets/images/facebook.png'),

                    const SizedBox(height: 24),

                    Text(
                      'Fiók létrehozása manuálisan:',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
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
                          activeColor: theme
                              .primaryColor, // Kitöltött szín, ha be van pipálva
                          checkColor: Colors.white, // Pipálás színe
                          side: BorderSide(
                            color: theme.primaryColor,
                            width: 2,
                          ), // Csak a keret látszik, ha nincs bepipálva
                          fillColor: MaterialStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return theme
                                    .primaryColor; // Kitöltés, ha be van pipálva
                              }
                              return Colors
                                  .transparent; // Nincs kitöltés, ha nincs bepipálva
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Hozzájárulok személyes adataim kezeléséhez',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Fiók létrehozása gomb
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward, size: 20),
                      label: Text(
                        'Fiók létrehozása',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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

  Widget _buildSocialButton(String text, String assetPath) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: BorderSide(color: theme.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(assetPath, width: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {bool obscureText = false, bool withHelpIcon = false}) {
    final theme = Theme.of(context);
    return TextField(
      obscureText: obscureText,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: withHelpIcon
            ? IconButton(
                icon: Icon(Icons.info_outline, color: theme.primaryColor),
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
    final theme = Theme.of(context);
    return TextField(
      obscureText: isPassword ? !_showPassword : !_showConfirmPassword,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(
            isPassword
                ? (_showPassword ? Icons.visibility : Icons.visibility_off)
                : (_showConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
            color: theme.primaryColor,
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
