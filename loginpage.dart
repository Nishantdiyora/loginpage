import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/detail_screen.dart';
import 'package:loginpage/logout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool selectedValue = false;
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please! Enter Your Name";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: passwordcontroller,
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
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: TextFormField(
                      //     // controller: ,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return "Please! Enter Your Password";
                      //       }
                      //     },
                      //     decoration: InputDecoration(
                      //         hintText: "Enter Your Password",
                      //         labelText: "Password",
                      //         labelStyle: TextStyle(color: Colors.black)),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      CheckboxListTile(
                        activeColor: Colors.blue,
                        value: selectedValue,
                        checkColor: Colors.white,
                        autofocus: false,
                        onChanged: (var value) {
                          setState(() {
                            selectedValue = value!;
                          });
                          print(value);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'If terms and condition',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Logout()));
                                if (_formkey.currentState!.validate()) ;
                                signupWithFirebase();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("You're Login")));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => welcome()));
                                // final box = GetStorage();
                                // box.write("email", emailcontroller.text);
                                // box.read("email");
                                // box.listen(() {
                                //   print("Change your name");
                                // });
                                // box.remove(listen);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => LoginPage()));
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
                                      'Submit',
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

  signupWithFirebase() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("user-not-found")));
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user.")));
      }
    }
    signOut() async {
      await FirebaseAuth.instance.signOut();
    }
  }
}
//   postApiCalling() async {
//     var response = await http.post(Uri.parse("https://reqres.in/api/users"),
//         body: {"name": "morpheus", "job": "leader"});
//     print(response.body);
//   }
// }
