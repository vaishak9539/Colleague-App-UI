// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/ad_event.dart';
import 'package:colleagueapp/admin/ad_request.dart';
import 'package:flutter/material.dart';

class AdRequestRequest extends StatefulWidget {
  const AdRequestRequest({super.key});

  @override
  State<AdRequestRequest> createState() => _AdRequestRequestState();
}

class _AdRequestRequestState extends State<AdRequestRequest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: TabBarView(children: [AdRequest(), AdEvent()]),
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
                  color: Colors.white),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: Color(0xffb4472B2),
                      borderRadius: BorderRadius.circular(60)),
                  indicatorPadding: EdgeInsets.all(5),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(),
                  tabs: [
                    Tab(
                      text: "Request",
                    ),
                    Tab(
                      text: "Event",
                    )
                  ]),
            ),
          ),
        ),
      ])),
    );
  }
}
