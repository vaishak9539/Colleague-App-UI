// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TeAddEvent extends StatefulWidget {
  const TeAddEvent({super.key});

  @override
  State<TeAddEvent> createState() => _TeAddEventState();
}

class _TeAddEventState extends State<TeAddEvent> {
  var size, width, height;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> teacherAddingEvent() async {
    await FirebaseFirestore.instance.collection("TeacherAddEvent").add({
      "EventName": eventNameController.text,
      "Date": dateController.text,
      "Time": timeController.text,
      "Location": locationController.text,
      "Description": descriptionController.text,
    });
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999, 1, 1),
      lastDate: DateTime(2100, 1, 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text = picked.format(context);
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
        title: Text("Event",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
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
                    padding: const EdgeInsets.only(left: 25, top: 40),
                    child: Text("Event Name",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )),
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
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Text("Date",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )),
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
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  pickDate();
                                },
                                icon: Icon(Icons.date_range_outlined)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date is Empty";
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
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Text("Time",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )),
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
                        controller: timeController,
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  pickTime();
                                },
                                icon: Icon(Icons.access_time_outlined)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Time is Empty";
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
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Text("Location",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )),
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
                        controller: locationController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Location is Empty";
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
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Text("Description",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )),
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
                        maxLines: 4,
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
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        teacherAddingEvent();
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: height / 16,
                      width: width / 1.1,
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
      ),
    );
  }
}
