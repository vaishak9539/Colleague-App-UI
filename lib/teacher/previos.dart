// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/teacher/te_previos_event_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Previos extends StatefulWidget {
  const Previos({super.key});

  @override
  State<Previos> createState() => _PreviosState();
}

class _PreviosState extends State<Previos> {
  Future<List<Map<String, dynamic>>> previousEvent() async {
    DateTime currentDate = DateTime.now();
    DateTime currentDateWithoutTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    ).toLocal();
    String formattedDate =
        currentDateWithoutTime.toIso8601String().split('T')[0];
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
        future: previousEvent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final events = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                
                final eventId = event['eventId'];
                final eventName = event['EventName'];
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Container(
                    height: height / 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff4472B2), // Fixed hex color
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                // FoodFestivalDetails(eventData: event),
                                TePreviosEventDetails(eventid : eventId),
                                
                          ),
                        );
                      },
                      title: Text(
                        eventName,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No previos events.'));
          }
        },
      ),
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 30,left: 10),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           InkWell(
      //             onTap: (){
      //               Navigator.push(context, MaterialPageRoute(builder: (ctx){
      //                 return TePreviosEventDetails();
      //               }));
      //             },
      //             child: Container(
      //               height: 45,
      //               width: 300,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(6),
      //                   color: Color(0xffb4472B2)),
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top: 13, left: 50),
      //                 child: Text("Onam festival",
      //                     style: GoogleFonts.poppins(
      //                       textStyle: TextStyle(
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w500,
      //                           color: Colors.white),
      //                     )),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Padding(
      //   padding: const EdgeInsets.only(top: 10),
      //   child: Row(
      //     children: [
      //       Container(
      //         height: 45,
      //         width: 300,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(6),
      //             color: Color(0xffb4472B2)),
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 13, left: 50),
      //           child: Text("Music Festival",
      //               style: GoogleFonts.poppins(
      //                 textStyle: TextStyle(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w500,
      //                     color: Colors.white),
      //               )),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      //     ],
      //   ),
      // ),
    );
  }
}
