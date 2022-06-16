import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Providers/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // List<int> SearchResultIDs = [];
  // List<KeepNote?> SearchResultNotes = [];

  // bool isLoading = false;

  // void SearchResults(String query) async {
  //   SearchResultNotes.clear();
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final ResultIds = await KeepNotesDatabase.instance.getNoteString(query);
  //   List<KeepNote?> SearchResultNotesLocal = [];
  //   ResultIds.forEach((element) async {
  //     final SearchNote = await KeepNotesDatabase.instance.readOneNote(element);
  //     SearchResultNotesLocal.add(SearchNote);
  //     setState(() {
  //       SearchResultNotes.add(SearchNote);
  //     });
  //   });

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: white.withOpacity(0.1)),
            child: Column(
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
                        onSubmitted: (value) {
                          // setState(
                          //   () {
                          //     SearchResults(value.toLowerCase());
                          //   },
                          // );
                        },
                      ),
                    ),
                  ],
                ),
                NoteSectionAll()
                // isLoading
                //     ? Center(
                //         child: CircularProgressIndicator(
                //           color: Colors.white,
                //         ),
                //       )
                //     : NoteSectionAll()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget NoteSectionAll() {
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
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
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
                      Text('Heading',
                        // SearchResultNotes[index]!.title,
                          style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'sdgfbfghfj',
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
