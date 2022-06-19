import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kepp_notes_clone/Providers/colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _splashScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SizedBox(
          width: ScreenUtil().setWidth(100),
          child: Image.asset('asset/app_icon.png'),
        ),
      ),
    );
  }

  Future _splashScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed('/first');
  }
}
