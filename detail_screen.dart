import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/home_screen.dart';
import 'package:loginpage/loginpage.dart';
import 'package:loginpage/phon_auth_page.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Name";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Your Name",
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Email";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Your Email",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Password";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) ;
                      LoginFirebase();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Successsully Signup")));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FirebaseService().GoogleSignin();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/macro.png"))),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/facebook.png"))),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhonAuthPage()));
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn-icons-png.flaticon.com/128/3536/3536505.png")))),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    ));
  }

  LoginFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      FirebaseFirestore.instance.collection("User").add({
        "name": namecontroller.text,
        "email": emailcontroller.text,
        "password": passwordcontroller.text
      }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Added on cloud firestore"))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The account already exists for that email.")));
      }
    } catch (e) {
      print(e);
    }
  }
}

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  GoogleSignin() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authcredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        await _auth.signInWithCredential(authcredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
