import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Providers/colors.dart';
import '../services/services.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final services = Services();
  final _notes = FirebaseFirestore.instance;
var searchList = [];
  @override
  Widget build(BuildContext context) {
     final user = FirebaseAuth
        .instance
        .currentUser;
    final email = user!.email;   
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: white.withOpacity(0.1)),
            child: StreamBuilder<QuerySnapshot>(
              stream: _notes.collection('notes').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var list = snapshot.data!.docs;
                  return Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: white,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            style: const TextStyle(
                              color: white,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Search our Notes",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              
                              list.forEach((element) { 
                                // searchList.clear();
                                if (element['title'].toString().toLowerCase().contains(value.toLowerCase())) {
                                  setState(() {
                                    searchList.clear();
                                    searchList.add(element);
                                    
                                  });
                                
                                }
                              });
                              
                              
                            },
                          ),
                        ),
                      ],
                    ),
                    noteSectionAll(searchList),
                    
                    // isLoading
                    //     ? Center(
                    //         child: CircularProgressIndicator(
                    //           color: Colors.white,
                    //         ),
                    //       )
                    //     : NoteSectionAll()
                  ],
                );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              }
            ),
          ),
        ),
      ),
    );
  }

  Widget noteSectionAll(list) {
    print(list);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "SEARCH RESULTS",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchList.length,
              // itemCount: SearchResultNotes.length,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) =>
                  //         NoteView(note: SearchResultNotes[index]!)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: white.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(searchList[index]['title'],
                          
                        // SearchResultNotes[index]!.title,
                          style:const TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        searchList[index]['note'],
                        // SearchResultNotes[index]!.content.length > 250
                        //     ? "${SearchResultNotes[index]!.content.substring(0, 250)}..."
                        //     : SearchResultNotes[index]!.content,
                        style: TextStyle(color: white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
