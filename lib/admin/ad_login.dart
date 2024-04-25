// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/ad_request_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdLogin extends StatefulWidget {
  const AdLogin({super.key});

  @override
  State<AdLogin> createState() => _AdLoginState();
}

class _AdLoginState extends State<AdLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xf4472B2),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("Login",
                    style: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4472B2),
                      )
                    ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.grey,),
                    hintText: "Username"
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                    hintText: "Password"
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
               InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AdRequestRequest()));
                },
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff4472B2),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                           color: Colors.white,
                            ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}