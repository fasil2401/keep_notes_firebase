import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kepp_notes_clone/model/note_model.dart';
import 'package:kepp_notes_clone/services/services.dart';
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
  final services = Services();
  var color ='0xFFF5F5F5';
  var backcolor ='0xFF212227';
  var hintColor = Colors.grey.withOpacity(0.8);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
 final user = FirebaseAuth
        .instance
        .currentUser;
    final email = user!.email;   

    return WillPopScope(
      onWillPop: () async{
       if(title.text. isNotEmpty || content.text.isNotEmpty){
 final note = Note(title: title.text, note: content.text, createdtime: DateTime.now(), isarchieve: false, ispinned: false, color: color);
        await services.createNote(note);
       }
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
                    content: SizedBox(
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
                          color: color == '0xFF212227' ? hintColor : Colors.black)),
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
                            color:color == '0xFF212227' ? hintColor : Colors.black)),
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
