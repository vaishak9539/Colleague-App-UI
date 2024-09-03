// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodFestivalDetails extends StatefulWidget {
  final Map<String, dynamic> eventData;
  var eventdata;
  FoodFestivalDetails({super.key, required this.eventData});

  @override
  State<FoodFestivalDetails> createState() => _FoodFestivalDetailsState();
}

class _FoodFestivalDetailsState extends State<FoodFestivalDetails> {
  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: height / 6,
            width: width / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0x0f4472b2),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        widget.eventData["EventName"],
                        style: TextStyle(
                            color: Color(0xff4472B2),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Text(
                            "Date",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Text(
                            "Time",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 15),
                          child: Text(
                            "Location",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            ":",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            ":",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            ":",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Text(
                            widget.eventData["Date"],
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Text(
                            widget.eventData["Time"],
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 15),
                          child: Text(
                            widget.eventData["Location"],
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Text(
                  "Participants",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (ctx, context) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffF1F6FF)),
                      child: ListTile(
                          leading: SizedBox(
                            width: 35,
                            child: Image.asset("assets/images/User 1.png"),
                          ),
                          title: Text(
                            "Student Name",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          subtitle: Text(
                            "Department",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: ctx,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: Colors.grey[200],
                                        title: Text("Confirm Co-Ordinator"),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(ctx);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Color(0xfb4472B2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  "Submit",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(
                                CupertinoIcons.clear_circled_solid,
                                color: Color(0xfb4472B2),
                              ))),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
