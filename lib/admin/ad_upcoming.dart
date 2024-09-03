// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/admin/Ad_upcoming_foodevent_details.dart';
import 'package:colleagueapp/admin/ad_add_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdUpcoming extends StatefulWidget {
  const AdUpcoming({super.key});

  @override
  State<AdUpcoming> createState() => _AdUpcomingState();
}

class _AdUpcomingState extends State<AdUpcoming> {
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
        .where('Date', isGreaterThan: formattedDate)
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
      body: FutureBuilder(
          future: getUpcomingEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(child: Text("No task added"));
            }
            if (snapshot.hasData) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        
                        var adEventId = snapshot.data![index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: Container(
                            width: width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xffb4472B2)),
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              AdUpcomingFootEventDetails(adEventId : adEventId)));
                                },
                                title: Text(adEventId["EventName"],
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )),
                                trailing: IconButton(
                                    onPressed: (){
                                       FirebaseFirestore.instance.collection("AdminAddingEvent").doc(adEventId["AdminDocId"]).delete();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ))),
                          ),
                        );
                      }));
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Color(0xffb4472B2),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AdAddEvent()));
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
