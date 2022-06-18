import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Providers/colors.dart';
import '../Screens/archive.dart';
import '../Screens/homepage.dart';
import '../Screens/settings.dart';
class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: const Text(
                'Google Keep',
                style: TextStyle(
                    color: grey, fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: grey.withOpacity(0.5),
            ),
            sectionOne(),
            SizedBox(height: 10.h,),
            sectionTwo(),
            SizedBox(height: 10.h,),
            sectionSetting(),
          ],
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          child: Row(
            children: [
              const Icon(
                Icons.lightbulb_outline,
                color: grey,
                size: 25,
              ),
              SizedBox(
                width: 25.w,
              ),
              const Text(
                'Notes',
                style: TextStyle(fontSize: 18, color: grey),
              )
            ],
          ),
        ),
      ),
    );
  }

    Widget sectionTwo() {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: TextButton(
        style: ButtonStyle(
          // backgroundColor:
          //     MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArchiveView()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          child: Row(
            children: [
              const Icon(
                Icons.archive_outlined,
                color: grey,
                size: 25,
              ),
              SizedBox(
                width: 25.w,
              ),
              const Text(
                'Archive',
                style: TextStyle(fontSize: 18, color: grey),
              )
            ],
          ),
        ),
      ),
    );
  }


   Widget sectionSetting() {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: TextButton(
        style: ButtonStyle(
          // backgroundColor:
          //     MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
          ),
        ),
        onPressed: () {
          Get.back();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SettingsScreen()));
          
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          child: Row(
            children: [
              const Icon(
                Icons.settings_outlined,
                color: grey,
                size: 25,
              ),
              SizedBox(
                width: 25.w,
              ),
              const Text(
                'Settings',
                style: TextStyle(fontSize: 18, color: grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
