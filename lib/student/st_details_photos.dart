// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/student/st_imagepick.dart';
import 'package:flutter/material.dart';

class StDetailsPhotos extends StatefulWidget {
  const StDetailsPhotos({super.key});

  @override
  StDetailsPhotosState createState() => StDetailsPhotosState();
}

class StDetailsPhotosState extends State<StDetailsPhotos> {
  var onam = [
    "assets/images/onam 1 (1).jpg",
    "assets/images/onam 1 (2).jpg",
    "assets/images/onam 3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: onam.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  child: Image.asset(
                    onam[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => StImagePick(),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFb4472B2),
                    child: Icon(
                      Icons.add,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
