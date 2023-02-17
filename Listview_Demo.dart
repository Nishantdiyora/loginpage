import 'package:flutter/material.dart';
import 'package:loginpage/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({Key? key}) : super(key: key);

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // body: ListView(
          //  children: [
          //    Text("Hellio"),
          //    Text("gdfyew")
          //  ],
          //
          // ),
          body: Column(
        children: [
          ListView.separated(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();

                  await prefs.remove('isLogin');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signup()));
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${index}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color:
                          (index % 2 == 0) ? Colors.white : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 1.0,
                        )
                      ]),
                  height: 100,
                  width: 100,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
          ),
          Expanded(
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 100,
                itemBuilder: (BuildContext, index) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          Text(
                            '${index}.  Hello',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ));
                }),
          )
        ],
      )),
    );
  }
}
