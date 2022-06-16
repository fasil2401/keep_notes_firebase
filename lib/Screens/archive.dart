import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/SideMenuBar.dart';
import '../Providers/colors.dart';
import 'create_note.dart';
class ArchiveView extends StatefulWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  IconData viewType = Icons.grid_view;
  String searchText = '';
  String note =
      ' elit. F eet vitae nisi. Quisque. Duis pellentesque consectetur lacus. In quis dui et purus congue accumsan pulvinar vel lorem. Phasellus ultricies maximus odio ut ultricies. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque nec vulputate massa. Fusce magna massa, molestie at euismod eget, condimentum ut eros. In hac habitasse platea dictumst. Aenean dignissim dolor eu ante vestibulum dictum. Integer mi tortor, fringilla sed sapien et, fermentum consectetur est. Nunc porta leo id tortor imperdiet dictum.';
  String note1 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elitamet, consectetur adipiscing elit. Fusce molestie lor.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawerEnableOpenDragGesture: true,
      drawer: SideMenu(),
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateNoteView()));
        },
        child: Icon(Icons.add,
        size: 40.w,)
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: bgColor,
              floating: true,
              snap: true,
              toolbarHeight: 50.h,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Container(
                decoration: BoxDecoration(
                    color: black,
                    borderRadius: const BorderRadius.all(Radius.circular(22))),
                width: MediaQuery.of(context).size.width,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          onPressed: () {
                            _drawerKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.grey,
                          ),
                          splashRadius: .01,
                        );
                      },
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 180.w,
                      child:const Text(
                        'Search our Notes',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (viewType == Icons.grid_view) {
                            viewType = Icons.view_list_rounded;
                          } else {
                            viewType = Icons.grid_view;
                          }
                        });
                      },
                      icon: Icon(
                        viewType,
                        color: Colors.grey,
                      ),
                      splashRadius: .01,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CircleAvatar(
                      radius: 15.w,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              viewType == Icons.grid_view ? noteSectionAll() :  
              noteSectionList(),             
            ],
          ),
        ),
      ),
    );
  }

  Widget noteSectionAll() {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ALL",
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 15.h,
          ),
          // height: 500,
          child: StaggeredGridView.countBuilder(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            crossAxisCount: 4,
            staggeredTileBuilder: (index) =>const StaggeredTile.fit(2),
            itemBuilder: (context, index) =>
             InkWell(
               onTap: (){
                //  Navigator
                //  .of(context).push(MaterialPageRoute(builder: (context)=>NoteView()));
               },
               child: Container(

                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: index.isEven ? Colors.green : Colors.amber,
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                      children:  [
                       const Expanded(
                          child: Text(
                            // notesList[index].title,
                            'Heading',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.push_pin, size: 15,
                        color: white,
                        ),
                        SizedBox(width:2.w),
                        Icon(Icons.lock_clock, size: 15,
                        color: white,
                        ),
                        
                      ],
                    ),
                   const SizedBox(
                      height: 10,
                    ),
                    Text(
                      index.isEven
                          ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                          : note1,
                      style:const TextStyle(
                        color: white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                      // notesList[index].content.length > 250
                      //     ? "${notesList[index].content.substring(0, 250)}..."
                      //     : notesList[index].content,
                      '12-31-2022',
                      style:  TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    )
                  ],
                ),
                         ),
             ),
          ),
        ),
      ],
    );
  }


    Widget noteSectionList() {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ALL",
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 15.h,
          ),
          // height: 500,
          child: ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: index.isEven ? Colors.green : Colors.amber,
                  border: Border.all(color: white.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                      children:  [
                       const Expanded(
                          child: Text(
                            // notesList[index].title,
                            'Heading',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.push_pin, size: 15,
                        color: white,
                        ),
                        SizedBox(width:8.w),
                        Icon(Icons.lock_clock, size: 15,
                        color: white,
                        ),
                        
                      ],
                    ),
                 const SizedBox(
                    height: 10,
                  ),
                  Text(
                    index.isEven
                        ? note.length > 250
                            ? "${note.substring(0, 250)}..."
                            : note
                        : note1,
                    style:const TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                      height: 10,
                    ),
                   const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                      // notesList[index].content.length > 250
                      //     ? "${notesList[index].content.substring(0, 250)}..."
                      //     : notesList[index].content,
                      '12-31-2022',
                      style:  TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
