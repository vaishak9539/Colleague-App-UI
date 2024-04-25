// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StImagePick extends StatefulWidget {
  const StImagePick({super.key});

  @override
  State<StImagePick> createState() => _StImagePickState();
}

class _StImagePickState extends State<StImagePick> {
  XFile? pick;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Photo",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text("photo",
                      style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 350,
                width: 370,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  
                  child: IconButton(onPressed: ()async{
                    ImagePicker picked =ImagePicker();
                    pick =await picked.pickImage(source: ImageSource.gallery);
                    setState(() {
                      image=File(pick!.path);
                    });
                  }, icon: Image.asset("assets/images/add-image.png",
                  color: Color(0xffb4466B2).withOpacity(0.4),
                  )),
                )
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text("Description",
                      style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 370,
                height: 55,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffb4472B2)),
                  child: Center(
                    child: Text("Submit",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                            color: Colors.white)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
