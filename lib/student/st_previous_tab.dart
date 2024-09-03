// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_onam_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StPreviousTab extends StatefulWidget {
  const StPreviousTab({super.key});

  @override
  State<StPreviousTab> createState() => _StPreviousTabState();
}

class _StPreviousTabState extends State<StPreviousTab> {
  Future<List<Map<String, dynamic>>> getUpcomingEvents() async {
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
      appBar: AppBar(
        title: Text("Event",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: getUpcomingEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              final events = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  var event = events[index];

                  final eventId = event['eventId'];
                  final eventName = event['EventName'];
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Container(
                      height: height / 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffb4472B2)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      StOnamDetails(eventData: eventId)));
                        },
                        title: Text(eventName,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
