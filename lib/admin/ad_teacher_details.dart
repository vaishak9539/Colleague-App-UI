// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AdTeacherDetails extends StatefulWidget {
//   var stId;
//   AdTeacherDetails({super.key});

//   @override
//   State<AdTeacherDetails> createState() => _AdTeacherDetailsState();
// }

// class _AdTeacherDetailsState extends State<AdTeacherDetails> {
//   var size, width, height;
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Student Details",
//           style: GoogleFonts.poppins(
//               textStyle: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           )),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: height / 9,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 55,
//                   backgroundImage: AssetImage("assets/images/User 1.png"),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 // widget.stId["Name"],
//                 "aaa",
//                 style: GoogleFonts.poppins(
//                     textStyle:
//                         TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
//               ),
//             ),
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Text(
//                             "register No",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 19),
//                           child: Text(
//                             "Department",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 22),
//                           child: Text(
//                             "Phone No",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 22),
//                           child: Text(
//                             "Email ID",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 13),
//                           child: Text(
//                             ":",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Text(
//                             ":",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Text(
//                             ":",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 17),
//                           child: Text(
//                             ":",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Text(
//                             // widget.stId["RegisterNo"],
//                             "aaaa",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 19),
//                           child: Text(
//                             // widget.stId["Department"],
//                             "aaaaa",
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 22),
//                           child: Text(
//                             // widget.stId["PhoneNumber"],
//                             ""
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w400)),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 22),
//                           child: Text(
//                             widget.stId["Email"],
//                             style: GoogleFonts.poppins(
//                                 textStyle: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w400)),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             )
          
//             ,
//             SizedBox(
//               height: height / 8,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: height / 15,
//                   width: width / 2.2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xffb4472B2),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Accept",
//                     style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.white)),
//                   )),
//                 ),
//                 Container(
//                   height: height / 15,
//                   width: width / 2.2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xffb4472B2),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Reject",
//                     style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.white)),
//                   )),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
