// ignore_for_file: prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';

class TeNotification extends StatefulWidget {
  const TeNotification({super.key});

  @override
  State<TeNotification> createState() => _TeNotificationState();
}

class _TeNotificationState extends State<TeNotification> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,right: 15
            ),
            child: Container(
              height: height/5.3,
              width: width/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xF4472B2),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Onam",
                          style: TextStyle(
                              color: Color(0xff4472B2),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,top: 10),
                      child: Text("We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can't wait to make it a memorable occasion for all."),
                    ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
