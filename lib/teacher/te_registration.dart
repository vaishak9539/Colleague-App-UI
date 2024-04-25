// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/teacher/te_student_list.dart';
import 'package:flutter/material.dart';

class TeRegistration extends StatefulWidget {
  const TeRegistration({super.key});

  @override
  State<TeRegistration> createState() => _TeRegistrationState();
}

class _TeRegistrationState extends State<TeRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.only(top: 56),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Registration",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                  ),),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 60),
                    child: Text("Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 6),
                   child: SizedBox(
                    height: 45,
                    width: 350,
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                     ),
                   ),
                 ),
               ],
             ),

             Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Text("Department",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 6),
                   child: SizedBox(
                    height: 45,
                    width: 350,
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                     ),
                   ),
                 ),
               ],
             ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Text("Phone No",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 6),
                   child: SizedBox(
                    height: 45,
                    width: 350,
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                     ),
                   ),
                 ),
               ],
             ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Text("Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 6),
                   child: SizedBox(
                    height: 45,
                    width: 350,
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                     ),
                   ),
                 ),
               ],
             ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Text("Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 6),
                   child: SizedBox(
                    height: 45,
                    width: 350,
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                     ),
                   ),
                 ),
               ],
             ),
             SizedBox(
              height: 155,
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=>TeStudentList())),
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffb4472B2)
                  
                    ),
                    child: Center(
                      child: Text("Submit",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
                )
              ],
             )
            ],
          ),
        ),
      ),
    );
  }
}