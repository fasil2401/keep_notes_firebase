
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kepp_notes_clone/Controllers/google_sign_in_controller.dart';
import 'package:kepp_notes_clone/Screens/archive.dart';
import 'package:kepp_notes_clone/Screens/create_note.dart';
import 'package:kepp_notes_clone/Screens/edit_note.dart';
import 'package:kepp_notes_clone/Screens/firstpage.dart';
import 'package:kepp_notes_clone/Screens/loginpage.dart';
import 'package:kepp_notes_clone/Screens/note_view.dart';
import 'package:kepp_notes_clone/Screens/search_page.dart';
import 'package:kepp_notes_clone/Screens/settings.dart';
import 'package:kepp_notes_clone/Screens/splash.dart';
import 'package:provider/provider.dart';
import 'Screens/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      textTheme: TextTheme(
      )
    );
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: GetMaterialApp(
          title: 'NotX',
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
            colorScheme: theme.colorScheme
                .copyWith(secondary: Colors.transparent, primary: Colors.blue),
          ),
          // home: HomePage(),
          initialRoute: '/splash',
          
          getPages: [
            GetPage(name: '/splash', page: ()=> SplashScreen(),),
            GetPage(name: '/first', page: ()=> FirstPage(),),
        GetPage(name: '/login', page: ()=> LoginPage()),
        GetPage(name: '/', page: ()=> HomePage()),
        GetPage(name: '/archive', page: ()=> ArchiveView()),
        GetPage(name: '/editnote', page: ()=> EditNoteView()),
        GetPage(name: '/create', page: ()=> CreateNoteView()),
        GetPage(name: '/search', page: ()=> SearchView()),
        GetPage(name: '/settings', page: ()=> SettingsScreen()),
        GetPage(name: '/viewnote', page: ()=> NoteView())
          ],
        ),
      ),
    );
  }
}

