// import 'package:flutter/material.dart';
//
// class register extends StatefulWidget {
//   const register({Key? key}) : super(key: key);
//
//   @override
//   State<register> createState() => _registerState();
// }
//
// class _registerState extends State<register> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/black.jpeg'), fit: BoxFit.cover)),
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //   elevation: 0,
//         // ),
//         backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//       child: Column(
//       children: [
//       SizedBox(
//         height: 180,
//       ),
//       Container(
//         height: 573.2,
//         width: 420,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 70),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Name',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: 'UserName',
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       ],
//     ),
//     ),
//         // body: Column(
//         //   children: [
//             // Container(
//                 // padding: EdgeInsets.only(left: 50, top: 20),
//                 // child: Text(
//                 //   'Signup\nPage',
//                 //   style: TextStyle(color: Colors.white, fontSize: 35),
//                 // ),
//                 ),
//             // Container(
//             //   decoration: BoxDecoration(
//             //       color: Colors.white,
//             //       borderRadius: BorderRadius.only(
//             //         topLeft: Radius.circular(40),
//             //         topRight: Radius.circular(40),
//             //       )),
//             //   child: Column(
//             //     children: [
//             //       TextFormField(
//             //         decoration: InputDecoration(
//             //           hintText: 'Name',
//             //         ),
//             //       ),
//             //       SizedBox(
//             //         height: 30,
//             //       ),
//             //       TextFormField(
//             //         decoration: InputDecoration(
//             //           hintText: 'UserName',
//             //         ),
//             //       )
//             //     ],
//             //   ),
//             // ),
//             // Container(
//             //   height: 580,
//             //   width: 420,
//             //   color: Colors.white,
//             // )
//             // SingleChildScrollView(
//             //   child: Container(
//             //     padding: EdgeInsets.only(
//             //         top: MediaQuery.of(context).size.height * 0.28,
//             //         right: 25,
//             //         left: 25),
//             //     child: Column(
//             //       children: [
//             //         // TextField(
//             //         //   decoration: InputDecoration(
//             //         //       focusedBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       enabledBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       hintText: 'Name',
//             //         //       hintStyle: TextStyle(color: Colors.white),
//             //         //       border: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10))),
//             //         // ),
//             //         // SizedBox(
//             //         //   height: 30,
//             //         // ),
//             //         // TextField(
//             //         //   decoration: InputDecoration(
//             //         //       focusedBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       enabledBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       hintText: 'Email',
//             //         //       hintStyle: TextStyle(color: Colors.white),
//             //         //       border: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10))),
//             //         // ),
//             //         // SizedBox(
//             //         //   height: 30,
//             //         // ),
//             //         // TextField(
//             //         //   obscureText: true,
//             //         //   decoration: InputDecoration(
//             //         //       focusedBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       enabledBorder: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10),
//             //         //           borderSide: BorderSide(color: Colors.white)),
//             //         //       hintText: 'Password',
//             //         //       hintStyle: TextStyle(color: Colors.white),
//             //         //       border: OutlineInputBorder(
//             //         //           borderRadius: BorderRadius.circular(10))),
//             //         // ),
//             //         // SizedBox(
//             //         //   height: 30,
//             //         // ),
//             //         // Row(
//             //         //   mainAxisAlignment: MainAxisAlignment.end,
//             //         //   children: [
//             //         //     // Text(
//             //         //     //   'Sign in',
//             //         //     //   style: TextStyle(
//             //         //     //     color: Colors.white,
//             //         //     //     fontSize: 30,
//             //         //     //     fontWeight: FontWeight.w700,
//             //         //     //   ),
//             //         //     // ),
//             //         //   ],
//             //         // ),
//             //         // SizedBox(
//             //         //   height: 30,
//             //         //),
//             //         // Row(
//             //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         //   children: [
//             //         //     TextButton(
//             //         //         onPressed: () {},
//             //         //         child: Text(
//             //         //           'Sign Up',
//             //         //           style: TextStyle(
//             //         //               decoration: TextDecoration.underline,
//             //         //               fontSize: 18,
//             //         //               color: Colors.white),
//             //         //         )),
//             //         //     TextButton(
//             //         //         onPressed: () {
//             //         //           Navigator.pushNamed(context, 'register');
//             //         //         },
//             //         //         child: Text(
//             //         //           'Forgot Password',
//             //         //           style: TextStyle(
//             //         //               decoration: TextDecoration.underline,
//             //         //               fontSize: 18,
//             //         //               color: Colors.white),
//             //         //         ))
//             //         //   ],
//             //         // )
//             //       ],
//             //     ),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:loginpage/signup.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/moon.jpeg'), fit: BoxFit.fill)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'welcome',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 300),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      minWidth: double.infinity,
                      color: Colors.blue,
                      height: 50,
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: double.infinity,
                      color: Colors.blue,
                      height: 50,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(40)),
                    )
                  ],
                ),
                height: 573.2,
                width: 420,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/moon.jpeg'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
