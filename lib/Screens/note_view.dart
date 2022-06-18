import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kepp_notes_clone/model/note_model.dart';

import '../Providers/colors.dart';
import '../services/services.dart';

class NoteView extends StatefulWidget {
  // KeepNote note;
  var list;
  NoteView({Key? key, this.list}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  bool? pinned;
  bool? archieved;
  final services = Services();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.note.pin);
    pinned = widget.list['ispinned'];
    archieved = widget.list['isarchieve'];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final note = Note(
            title: widget.list['title'],
            note: widget.list['note'],
            createdtime: widget.list['createdtime'].toDate(),
            isarchieve: archieved!,
            ispinned: pinned!,
            color: widget.list['color']);
        await services.updateNote(note, widget.list['id'].toString());
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(int.parse(widget.list['color'])),
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    pinned = !pinned!;
                  });
                },
                icon: pinned == true
                    ? const Icon(Icons.push_pin)
                    : const Icon(Icons.push_pin_outlined)),
            IconButton(
                onPressed: () async {
                  setState(() {
                    archieved = !archieved!;
                  });
                },
                icon: archieved == true
                    ? const Icon(Icons.archive)
                    : const Icon(Icons.archive_outlined)),
            IconButton(
              onPressed: () async {
                final docUser = FirebaseFirestore.instance
                    .collection('notes')
                    .doc(widget.list['id']);
                docUser.delete();
                Get.back();
              },
              splashRadius: 20.w,
              icon: const Icon(Icons.delete_outlined),
            ),
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => EditNoteView(
                //           note: widget.note,
                //         )));
              },
              splashRadius: 20.w,
              icon: Icon(Icons.edit_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateFormatter.format(widget.list['createdtime'].toDate()),
                  style: TextStyle(
                    color: widget.list['color'] == '0xFF212227'
                        ? white
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.list['title'],
                  style: TextStyle(
                    color: widget.list['color'] == '0xFF212227'
                        ? white
                        : Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.list['note'],
                  style: TextStyle(
                    color: widget.list['color'] == '0xFF212227'
                        ? white
                        : Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
