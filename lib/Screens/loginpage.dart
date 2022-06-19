import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kepp_notes_clone/Controllers/google_sign_in_controller.dart';
import 'package:kepp_notes_clone/Providers/colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: ScreenUtil().setWidth(100),
              child: Image.asset('asset/app_icon.png'),
            ),

          ),
           SizedBox(height: 20.h,),
          Center(
            child: Text(
              'Welcome Aboard',
              style: TextStyle(
                fontSize: 30.w,
                fontFamily: 'monseratt',
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Center(
            child: FloatingActionButton.extended(
              onPressed: () {
                final provider =Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.signIn();
              },
              label:const Text('Sign In with google',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'monseratt',
                    fontWeight: FontWeight.bold,
                  )),
              icon:const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
