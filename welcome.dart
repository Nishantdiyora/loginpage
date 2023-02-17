import 'package:flutter/material.dart';
import 'package:loginpage/loginpage.dart';
import 'package:loginpage/signup.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/dior.jpeg'), fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                color: Color(0xff339D9A),
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => signup()));
              },
              minWidth: double.infinity,
              height: 50,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.4, 0.8],
                      colors: [
                        Color(0xffE09BA3),
                        Color(0xff339D9A),
                        Color(0xff6EA19C),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 50,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginPage()));
              },
              minWidth: double.infinity,
              height: 50,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.4, 0.8],
                      colors: [
                        Color(0xffE09BA3),
                        Color(0xff339D9A),
                        Color(0xff6EA19C)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 50,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Privacy & Policy....',
                  style: TextStyle(color: Color(0xff339D9A), fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
