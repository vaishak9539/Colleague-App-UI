// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/teacher/food_festival_details.dart';
import 'package:colleagueapp/teacher/te_add_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

   Future<List<Map<String, dynamic>>> getUpcomingEvents() async {
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
      .where('Date', isGreaterThan:  formattedDate)
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
        future: getUpcomingEvents(),
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
                // final eventId = event['eventId'];
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
                            builder: (ctx) => FoodFestivalDetails(eventData: event),
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
            return Center(child: Text('No upcoming events.'));
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Color(0xff4472B2), // Fixed hex color
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => TeAddEvent()),
            );
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
