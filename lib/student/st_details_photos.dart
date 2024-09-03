// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_imagepick.dart';
import 'package:flutter/material.dart';

class StDetailsPhotos extends StatefulWidget {
  final eventid;
   StDetailsPhotos({super.key, required this. eventid});

  @override
  StDetailsPhotosState createState() => StDetailsPhotosState();
}

class StDetailsPhotosState extends State<StDetailsPhotos> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('event_photos')
                  .where('eventId', isEqualTo:widget.eventid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No photos available for this event.'),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var imageUrl = snapshot.data!.docs[index]['imageUrl'];
                      return Image.network(
                        imageUrl,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StImagePick(eventid: widget.eventid)
                      ));
                },
                // image Add Function...........
                shape: const CircleBorder(),
                backgroundColor: Color(0xff4472B2),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
