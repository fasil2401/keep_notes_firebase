import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kepp_notes_clone/services/services.dart';
import '../Providers/colors.dart';
import '../model/note_model.dart';

class EditNoteView extends StatefulWidget {
  // KeepNote note;
  EditNoteView({Key? key, this.list}) : super(key: key);
  var list;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  var color = '0xFFF5F5F5';
  var backcolor = '0xFF212227';
  final services = Services();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.list['title'];
    _noteController.text = widget.list['note'];
    color = widget.list['color'];
    backcolor = widget.list['color'];
  }

  @override
  Widget build(BuildContext context) {
     final user = FirebaseAuth
        .instance
        .currentUser;
    final email = user!.email;   
    return WillPopScope(
      onWillPop: () async{
        final note = Note(
            title: _titleController.text,
            note: _noteController.text,
            createdtime: widget.list['createdtime'].toDate(),
            isarchieve: widget.list['isarchieve'],
            ispinned: widget.list['ispinned'],
            color: color);
        await services.updateNote(note, widget.list['id'].toString());
        Get.toNamed('/');
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(int.parse(backcolor)),
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          actions: [
            Padding(
                padding:  EdgeInsets.only(right: 20.w),
                child: GestureDetector(
                  onTap: (){
                    Get.defaultDialog(
                      title: 'Pick Color',
                      content: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .3,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: colors.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            
    
                            // childAspectRatio: 1.0,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                          ),
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  
                                  backcolor = colors[index];
                                  color = colors[index];
                                });
                                Get.back();
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(int.parse(colors[index])),
                                // radius: 20.w,
                              ),
                            );
                            
                          }),
                      )
                    );
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor:color != '0xFF212227' ? Color(int.parse(color)) : Colors.grey.withOpacity(0.8),
                  ),
                ),
              )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: TextFormField(
                    controller: _titleController,
                    style: TextStyle(
                        fontSize: 25,
                        // color: Colors.white,
                        color: widget.list['color'] == '0xFF212227'
                            ? white
                            : Colors.black,
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
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 400.h,
                  child: Form(
                    child: TextFormField(
                      controller: _noteController,
                      keyboardType: TextInputType.multiline,
                      minLines: 50,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 17,
                        color: widget.list['color'] == '0xFF212227'
                            ? white
                            : Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Note",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
