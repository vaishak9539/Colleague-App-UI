// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class PreviosOnamPhotos extends StatefulWidget {
  const PreviosOnamPhotos({super.key});

  @override
  State<PreviosOnamPhotos> createState() => _PreviosOnamPhotosState();
}

class _PreviosOnamPhotosState extends State<PreviosOnamPhotos> {
  var te_onam = ["assets/images/onam 1 (1).jpg", "assets/images/onam 1 (2).jpg", "assets/images/onam 3.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
            child: GridView.builder(
              itemCount: te_onam.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  child: Image.asset(
                    te_onam[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
    );
  }
}