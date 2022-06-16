import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Providers/colors.dart';
import 'homepage.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({Key? key}) : super(key: key);

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () async {
                // await KeepNotesDatabase.instance.InsertEntry(
                //   KeepNote(
                //     title: title.text,
                //     content: content.text,
                //     pin: false,
                //     createdTime: DateTime.now(),
                //     isArchieve: false,
                //   ),
                // );
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              splashRadius: 20.w,
              icon: Icon(Icons.save_outlined))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: title,
                cursorColor: white,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
              ),
              Container(
                height: 400.h,
                child: TextField(
                  controller: content,
                  cursorColor: white,
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Note",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
