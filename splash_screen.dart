import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginpage/Listview_Demo.dart';
import 'package:loginpage/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? getBoolValue;
  void initState() {
    getValue();
    Timer(Duration(seconds: 3), () {
      print("GETVALUE:::::${getValue()}");
      getBoolValue == true
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListviewDemo()))
          : Navigator.push(
              context, MaterialPageRoute(builder: (context) => signup()));
    });
    super.initState();
  }

  getValue() async {
    final prefs = await SharedPreferences.getInstance();
    getBoolValue = prefs.getBool('isLogin');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/dior.jpeg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              'Welcome To Our Login & SignUp Screen',
              style: TextStyle(
                color: Color(0xff339D9A),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
