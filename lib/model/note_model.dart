import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  final String title;
  final String note;
  final DateTime createdtime;
  final bool isarchieve;
  final bool ispinned;
  final String color;


  Note(
      {this.id = '',
      this.color = '0xFFa1f0a7',
      required this.title,
      required this.note,
      required this.createdtime,
      required this.isarchieve,
      required this.ispinned});
      

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'note': note, 'createdtime': createdtime, 'isarchieve': isarchieve, 'ispinned': ispinned, 'color': color};
  }

  Note.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
  :  id = doc['id'],
        title = doc['title'],
      note = doc['note'],
      isarchieve = doc['isarchieve'],
      ispinned = doc['ispinned'],
      color = doc['color'],
      createdtime = (doc['createdtime'] as Timestamp).toDate();
      
}