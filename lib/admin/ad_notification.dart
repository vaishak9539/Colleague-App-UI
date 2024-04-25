// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/add_notification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdNotification extends StatefulWidget {
  const AdNotification({super.key});

  @override
  State<AdNotification> createState() => _AdNotificationState();
}

class _AdNotificationState extends State<AdNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 165,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Onam",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffb4472B2),
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 240),
                              child: Icon(Icons.delete),
                            )
                          ],
                        ),
                        Text(
                            "We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can't wait to make it a memorable occasion for all.")
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xf4472B2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 440,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotification(),
                    ));
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffb4472B2),
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
