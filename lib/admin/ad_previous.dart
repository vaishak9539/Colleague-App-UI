// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdPrevious extends StatefulWidget {
  const AdPrevious({super.key});

  @override
  State<AdPrevious> createState() => _AdPreviousState();
}

class _AdPreviousState extends State<AdPrevious> {
  Future<List<Map<String, dynamic>>> getPreviousEvents() async {
    DateTime currentDate = DateTime.now();
    DateTime currentDateWithoutTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    ).toLocal();
    String formattedDate = currentDateWithoutTime.toIso8601String().split('T')[0];
    print('current date without time: $formattedDate');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('AddingEvent')
        .where('Date', isLessThan: formattedDate)
        .get();

    List<Map<String, dynamic>> events = querySnapshot.docs.map((doc) {
      Map<String, dynamic> eventData = doc.data();
      eventData['eventId'] = doc.id;
      return eventData;
    }).toList();
    print('$events....previous events');
    return events;
  }

  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getPreviousEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text("No Task Added"));
          } else if (snapshot.hasData) {
            final events = snapshot.data!;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 14, top: 10, right: 16),
                  child: Container(
                    height: height / 6,
                    width: width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff4472B2).withOpacity(0.2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 14),
                              child: Text(
                                event["EventName"] ?? "No Name",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xff4472B2),
                                  ),
                                ),
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
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "Date",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "Time",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "Location",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 9),
                                  child: Text(":"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 11),
                                  child: Text(":"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(":"),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    event["Date"] ?? "No Date",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    event["Time"] ?? "No Time",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    event["Location"] ?? "No Location",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text("No Task Added"));
        },
      ),
    );
  }
}
