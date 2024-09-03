// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors
import 'package:colleagueapp/teacher/event.dart';
import 'package:colleagueapp/teacher/student.dart';
import 'package:flutter/material.dart';

class TeStudentList extends StatefulWidget {
  const TeStudentList({Key? key}) : super(key: key);

  @override
  State<TeStudentList> createState() => _TeStudentListState();
}

class _TeStudentListState extends State<TeStudentList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      Student(),
                      Event()
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white), // Change color as needed
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Color(0xffb4472B2),
                      borderRadius: BorderRadius.circular(60)
                    ),
                    indicatorPadding: EdgeInsets.all(5),
                    labelColor: Colors.white,
                    labelStyle: TextStyle(),
                    tabs: [
                      Tab(
                        text: "Student",
                      ),
                      Tab(
                        text: "Event",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
