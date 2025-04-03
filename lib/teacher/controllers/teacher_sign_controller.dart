import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TeacherSignController extends ChangeNotifier {
  final _collection = FirebaseFirestore.instance.collection("TeacherSign");

  Future<void> registerTeacher({
    required String name,
    required String department,
    required String phoneNumber,
    required String email,
    required String password,
    required String teacherId,
    required ValueChanged<Exception?> onError,
    required void Function() onSuccess,
  })
   async {
    UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: password);

      String teacherAuthenticationUid = userCredential.user!.uid;
    _collection.doc(teacherAuthenticationUid).set({
      "Name" : name,
      "Department" : department,
      "PhoneNumber" : phoneNumber
    });
  }
}
