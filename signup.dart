import 'package:flutter/material.dart';
import 'package:loginpage/Listview_Demo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 330,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/dior.jpeg"), fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.only(top: 310),
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Form(
                key: _formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please! Enter Your Email";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please! Enter Your Password";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgat Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) ;
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('isLogin', true);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ListviewDemo()));
                              },
                              minWidth: 400,
                              height: 50,
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                        0.1,
                                        0.4,
                                        0.8,
                                      ],
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
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
