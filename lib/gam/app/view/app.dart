import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zizu/gam/games/view/games_page.dart';

class Gam extends StatelessWidget {
  const Gam({Key key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light).copyWith(
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      home: const GamesPage(),
    );
  }
}
