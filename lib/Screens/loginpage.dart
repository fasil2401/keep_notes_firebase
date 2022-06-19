import 'package:flutter/material.dart';
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
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            final provider =Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.signIn();
          },
          label: Text('Sign In with google'),
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
