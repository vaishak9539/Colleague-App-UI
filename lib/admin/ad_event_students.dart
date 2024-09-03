// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AdEventStudents extends StatefulWidget {
  const AdEventStudents({super.key});

  @override
  State<AdEventStudents> createState() => _AdEventStudentsState();
}

class _AdEventStudentsState extends State<AdEventStudents> {
  var newstid;
  Future<QuerySnapshot> fetchEventRequestsWithStudentId() async {
    return FirebaseFirestore.instance
        .collection("StEventReg")
        .where("StId", isEqualTo: true)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchEventRequestsWithStudentId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No requests available"));
          } else  {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final request = snapshot.data!.docs[index];
                // final requestid = request.id;
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                  ),
                  title: Text(request["Name"]),
                );
              },
            );
          }
        },
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(top: 15),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (ctx) => AdEventStudentDetails()));
      //             },
      //             child: Container(
      //               height: 50,
      //               width: 380,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(6),
      //                   color: Color(0xffb4472B2)),
      //               child: Row(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: 10),
      //                     child: CircleAvatar(
      //                       radius: 17,
      //                       backgroundImage:
      //                           AssetImage("assets/images/User 1.png"),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: 15),
      //                     child: Text("Adhil requests Food Festival",
      //                         style: GoogleFonts.poppins(
      //                           textStyle: TextStyle(
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w500,
      //                               color: Colors.white),
      //                         )),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 15),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: 50,
      //             width: 380,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(6),
      //                 color: Color(0xffb4472B2)),
      //             child: Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10),
      //                   child: CircleAvatar(
      //                     radius: 17,
      //                     backgroundImage:
      //                         AssetImage("assets/images/User 1.png"),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 15),
      //                   child: Text("rajan requests Charismas",
      //                       style: GoogleFonts.poppins(
      //                         textStyle: TextStyle(
      //                             fontSize: 14,
      //                             fontWeight: FontWeight.w500,
      //                             color: Colors.white),
      //                       )),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
