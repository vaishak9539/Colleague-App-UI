// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviosOnamDetails extends StatefulWidget {
  final String neweventid;

  PreviosOnamDetails({super.key, required this.neweventid});

  @override
  State<PreviosOnamDetails> createState() => _PreviosOnamDetailsState();
}

class _PreviosOnamDetailsState extends State<PreviosOnamDetails> {
  var size, width, height;
  Map<String, dynamic>? eventDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEventDetails();
  }

  Future<void> fetchEventDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await FirebaseFirestore.instance
          .collection('AddingEvent')
          .doc(widget.neweventid)
          .get();
      setState(() {
        eventDetails = eventSnapshot.data();
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching event details: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : eventDetails == null
              ? Center(child: Text("No event details available"))
              : Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
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
                                  eventDetails!["EventName"] ?? "N/A",
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
                                      eventDetails!["Date"] ?? "N/A",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 25),
                                    child: Text(
                                      eventDetails!["Time"] ?? "N/A",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25, top: 15),
                                    child: Text(
                                      eventDetails!["Location"] ?? "N/A",
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
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(top: 45, left: 20),
          //       child: Text(
          //         "Participants",
          //         style: GoogleFonts.poppins(
          //             textStyle:
          //                 TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          //       ),
          //     )
          //   ],
          // ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (ctx, context) {
          //         return Padding(
          //           padding:
          //               const EdgeInsets.only(left: 20, right: 20, top: 15),
          //           child: Container(
          //             width: 350,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(6),
          //                 color: Color(0xffF1F6FF)),
          //             child: ListTile(
          //               leading: SizedBox(
          //                 width: 35,
          //                 child: Image.asset("assets/images/User 1.png"),
          //               ),
          //               title: Text(
          //                 "student Name",
          //                 style: GoogleFonts.poppins(
          //                   textStyle: TextStyle(
          //                       fontSize: 14, fontWeight: FontWeight.w400),
          //                 ),
          //               ),
          //               subtitle: Text(
          //                 "Department",
          //                 style: GoogleFonts.poppins(
          //                   textStyle: TextStyle(
          //                       fontSize: 12, fontWeight: FontWeight.w400),
          //                 ),
          //               ),
          //               trailing: CircleAvatar(
          //                 radius: 13,
          //                 backgroundColor: Color(0xff4472B2),
          //                 child: Icon(
          //                   Icons.close_rounded,
          //                   color: Colors.white,
          //                   size: 20,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
