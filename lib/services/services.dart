import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/note_model.dart';

class Services {
  Future createNote(Note user) async {
    final docUser = FirebaseFirestore.instance.collection('notes').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
  Future updateNote(Note user, String id) async {
    final docUser = FirebaseFirestore.instance.collection('notes').doc(id);
    user.id = id;
    final json = user.toJson();
    await docUser.update(json);
  }
}
