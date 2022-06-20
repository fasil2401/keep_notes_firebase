import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/emailcontroller.dart';
import '../model/note_model.dart';


final user = FirebaseAuth
        .instance
        .currentUser;
    final email = user!.email;   
    final emailController = Get.put(EmailController());
class Services {

   
  Future createNote(Note user) async {
    final docUser = FirebaseFirestore.instance.collection(emailController.email.value).doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
  Future updateNote(Note user, String id) async {
    final docUser = FirebaseFirestore.instance.collection(emailController.email.value).doc(id);
    user.id = id;
    final json = user.toJson();
    await docUser.update(json);
  }
}
