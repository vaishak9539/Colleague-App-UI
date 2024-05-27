// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/Ad_upcoming_foodevent_details.dart';
import 'package:colleagueapp/admin/ad_add_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AdUpcoming extends StatefulWidget {
  const AdUpcoming({super.key});

  @override
  State<AdUpcoming> createState() => _AdUpcomingState();
}

class _AdUpcomingState extends State<AdUpcoming> {
  var size, width, height;
  List upcomingEvent=["Food Festival","Charismas","Music Festival"];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) =>  Padding(
                padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffb4472B2)),
                  child: ListTile(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => AdUpcomingFootEventDetails()));
                    },
                    title: Text(upcomingEvent[index],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                            ),
                  trailing: IconButton(
                    onPressed: (){},
                     icon: Icon(Icons.delete,color: Colors.white,)
                  )
                ),
                            ),
              ),
            )
          ),
         
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => AdAddEvent()));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xffb4472B2),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
