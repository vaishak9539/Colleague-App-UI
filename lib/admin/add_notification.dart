// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  var size, width, height;
  var descriptionController = TextEditingController();
  var eventNameController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  Future<void> addNotification() async {
    if (formkey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection("AddNotification").add({
        "EventName": eventNameController.text,
        "DescriptionController": descriptionController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Notification",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 30),
                    child: Text(
                      "Event Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 6),
                    child: SizedBox(
                      height: height / 18,
                      width: width / 1.1,
                      child: TextFormField(
                        controller: eventNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Event Name is Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 30),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 6),
                    child: SizedBox(
                      width: width / 1.1,
                      child: TextFormField(
                        controller: descriptionController,
                        maxLines: 6,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Description is Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        addNotification();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: height / 16,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xffb4472B2)),
                        child: Center(
                          child: Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
