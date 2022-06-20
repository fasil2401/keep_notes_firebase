import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/emailcontroller.dart';
import 'homepage.dart';
import 'loginpage.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final emailController = Get.put(EmailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser;
              final email = user!.email;

              emailController.uppdateEmail(email!);
              return HomePage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
