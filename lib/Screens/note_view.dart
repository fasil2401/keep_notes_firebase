import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Providers/colors.dart';

class NoteView extends StatefulWidget {
  // KeepNote note;

  NoteView({Key? key,
  //  required this.note
   }) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  // String note =
  //     ' elit. F eet vitae nisi. Quisque. Duis pellentesque consectetur lacus. In quis dui et purus congue accumsan pulvinar vel lorem. Phasellus ultricies maximus odio ut ultricies. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque nec vulputate massa. Fusce magna massa, molestie at euismod eget, condimentum ut eros. In hac habitasse platea dictumst. Aenean dignissim dolor eu ante vestibulum dictum. Integer mi tortor, fringilla sed sapien et, fermentum consectetur est. Nunc porta leo id tortor imperdiet dictum.';
  // String note1 =
  //     'Lorem ipsum dolor sit amet, consectetur adipiscing elitamet, consectetur adipiscing elit. Fusce molestie lor.';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.note.pin);
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
                // await KeepNotesDatabase.instance.pinNote(widget.note);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.push_pin_outlined


                  // widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined
                  )),
          IconButton(
              onPressed: () async {
                // await KeepNotesDatabase.instance.archNote(widget.note);
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.archive_outlined
                
                // widget.note.isArchieve
                //   ? Icons.archive
                //   : Icons.archive_outlined
                  )),
          IconButton(
            onPressed: () async {
              // await KeepNotesDatabase.instance.deleteNote(widget.note);
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            splashRadius: 20.w,
            icon: Icon(Icons.delete_outlined),
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
                'Heading',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'fghfdhjgsa chvdshckdhs shgfdsyu',
                style: const TextStyle(
                  color: white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
