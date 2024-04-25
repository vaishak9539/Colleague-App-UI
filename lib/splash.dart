// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, use_build_context_synchronously

import 'package:colleagueapp/select_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

   @override
  void initState() {
    goToWelcome();
    super.initState();
  }
   void goToWelcome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
      return SelectOptions();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffb4472B2),
      body: Center(child: Text("Colleagueapp",
      style: GoogleFonts.poppins(
            textStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 35,
            color: Colors.white
            ),
          )
      )),
    );
  }
}