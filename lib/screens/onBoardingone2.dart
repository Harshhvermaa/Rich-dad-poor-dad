import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:richdadpoordad/global.dart';

import 'homescreen.dart';

class onBoardingtwo extends StatelessWidget {
  onBoardingtwo({super.key});
  TextEditingController _username = TextEditingController();

  checkField() async {
    if (_username.text.length < 1) {
      Get.defaultDialog(
        title: "Oops, Unfortunately you\ndidn't provide your name",
        content: Column(
          children: [
            Image(
              image: AssetImage("assets/embarrassed.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Text("")
          ],
        ),
      );
    } else {
      if (GetUtils.isEmail(_username.text)) {
        sharedPreferences!.setString("Username", _username.text.toString());
         FirebaseFirestore.instance
            .collection("Users")
            .doc(_username.text.toString())
            .set({"Email": _username.text.toString()})
            .catchError((onError) 
            {
              Get.defaultDialog(
        title: "${onError.text}",
        content: Column(
          children: [
            Image(
              image: AssetImage("assets/embarrassed.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Text("")
          ],
        ),
      );
            } );
        Get.offAll(() => Homescreen());
      } else {
        Get.defaultDialog(
          title: "Oops, Unfortunately your\nmail is faulty",
          content: Column(
            children: [
              Image(
                image: AssetImage("assets/embarrassed.png"),
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 15,
              ),
              Text("")
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 22),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            // image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(29),
                  height: screenHeight * 0.35,
                  width: screenwidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 32, 32, 34),
                    //   image: DecorationImage(image: AssetImage("assets/fs3.png"),
                    // fit: BoxFit.cover,
                  ),
                  child: Image(
                    image: AssetImage("assets/fs3.png"),
                    height: screenHeight * 0.3,
                    width: screenwidth * 0.4,
                  ),
                )
              ],
            ),

            // text
            Container(
              margin: EdgeInsets.only(
                  left: screenwidth * 0.05,
                  right: screenwidth * 0.05,
                  top: screenHeight * 0.08),
              child: Text(
                "Today a reader,\ntomorrow a leader.",
                style: TextStyle(
                    fontFamily: "Nunitomedium",
                    color: Color.fromARGB(255, 192, 192, 192),
                    fontSize: 30,
                    // fontWeight: FontWeight.w00,
                    // letterSpacing: ,
                    height: 1.2),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.175,
            ),

            // What shall i call you
            Container(
              margin: EdgeInsets.only(
                left: screenwidth * 0.04,
                right: screenwidth * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(
                    //     left: screenwidth * 0.04,right: screenwidth * 0.04, top: screenHeight * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please compose your e-mail",
                          style: TextStyle(
                              fontFamily: "Nunitoregular",
                              color: Color(0xFFC0C0C0).withOpacity(0.8),
                              fontSize: 18,
                              letterSpacing: -1.2,
                              height: 1.2),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        Container(
                          height: screenHeight * 0.065,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 32, 32, 34)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: TextField(
                              onSubmitted: (value) {
                                checkField();
                              },
                              style: TextStyle(
                                fontFamily: "Nunitoregular",
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              textAlign: TextAlign.left,
                              controller: _username,
                              cursorColor: Color.fromARGB(255, 49, 49, 49),
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontFamily: "Nunitoregular",
                                      color: Color.fromARGB(255, 192, 192, 192)
                                          .withOpacity(0.2)),
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                          width: screenwidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            // boxShadow: [
                            //   BoxShadow(
                            //     offset: Offset(4, 4),
                            //     color: Colors.white
                            //   )
                            // ]
                          ),
                          height: screenHeight * 0.065,
                          child: ElevatedButton(
                              onPressed: () {
                                checkField();
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Nunitomedium"),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(12.0),
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Color.fromARGB(255, 64, 91, 246),
                                    width: 0.5)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0))),
                                // backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 34, 52, 60)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: screenHeight*0.02,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
