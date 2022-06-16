import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Providers/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sync',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.w,
                  color: white
                ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Switch.adaptive(
                  value: value, 
                  onChanged: (switchValue){
                    setState(() {
                
                     this.value =switchValue; 
                    });
                  },
                  ),
                )
              ],
            )
          ],
        ),
      ),
      
    );
  }
}