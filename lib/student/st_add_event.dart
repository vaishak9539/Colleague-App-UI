// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class StAddEvent extends StatefulWidget {
  const StAddEvent({super.key});

  @override
  State<StAddEvent> createState() => _StAddEventState();
}

class _StAddEventState extends State<StAddEvent> {
  var size, width, height;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController requestEventController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

 Future<void> studentEventRequest(BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("StudentsEventRequest").add({
      "Request Event": requestEventController.text,
      "Name": nameController.text,
      "Department": departmentController.text,
      "Phone No": phoneNoController.text,
      "Description": departmentController.text,
      "created at": DateTime.now()
    });
    print("Event request added successfully");
    Fluttertoast.showToast(
      msg: "request added successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } catch (e) {
    print("Error adding event request: $e");
    Fluttertoast.showToast(
      msg: "request Failed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Request",
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
                    child: Text("Request Event",
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
                        controller: requestEventController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Request Event is Empty";
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
                    child: Text("Name",
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
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is Empty";
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
                    child: Text("Department",
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
                        controller: departmentController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Department is Empty";
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
                    child: Text("Phone No",
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
                        controller: phoneNoController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "PhoneNo is Empty";
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        studentEventRequest(context);
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
