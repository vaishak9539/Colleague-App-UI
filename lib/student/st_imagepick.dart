// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_typing_uninitialized_variables, use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StImagePick extends StatefulWidget {
  final String eventid;
  StImagePick({super.key, required this.eventid});

  @override
  State<StImagePick> createState() => _StImagePickState();
}

class _StImagePickState extends State<StImagePick> {
  XFile? pick;
  File? image;
  String? imageUrl;
  double? width, height;

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    pick = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        image = File(pick!.path);
      }
    });
  }

  bool isUploading = false;
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
                  child: Text("Photo",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: height! / 2.5,
                width: width! / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: image != null
                    ? Image.file(image!)
                    : InkWell(
                        onTap: pickImage,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 100,
                          color: Colors.black54,
                        ),
                      ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text("Description",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: width! / 1.1,
                height: height! / 15,
                child: TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: isUploading ? null : _onSendButtonClicked,
                  child: Container(
                    height: height! / 16,
                    width: width! / 1.1,
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> uploadImage(File image) async {
    try {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('events/${widget.eventid}/${DateTime.now().toString()}');

      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      final String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      throw Exception("Error uploading image");
    }
  }

  Future<void> addImageToFirestore(String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('event_photos').add({
        'eventId': widget.eventid,
        'imageUrl': imageUrl,
        'description': description.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding image to Firestore: $e");
      throw Exception("Error adding image to Firestore");
    }
  }

  void _onSendButtonClicked() async {
    setState(() {
      isUploading = true;
    });

    try {
      if (image != null) {
        String imageUrl = await uploadImage(image!);
        await addImageToFirestore(imageUrl);
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(
          msg: "Please select an image.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }
}
