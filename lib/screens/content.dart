import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:richdadpoordad/widgets/appbarofficial.dart';
import 'package:richdadpoordad/widgets/appbarofficial2.dart';

import '../global.dart';
import '../models/model.dart';
import 'translation.dart';

class Content extends StatelessWidget {
  int? index;
  Content({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    String? username = sharedPreferences!.getString("Username");

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 22),
      body: Stack(
        children: [
          
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  appbarOfficial2(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: screenwidth,
                          child: Text(
                            model[index!].title.toString(),
                            style: TextStyle(
                                fontFamily: "Nunitomedium",
                                color: Color(0xFF3A3A3B),
                                fontSize: screenHeight * 0.03,
                                // letterSpacing: -2.0,
                                height: 1.2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.004,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: screenwidth,
                          child: Text(
                            model[index!].lesson.toString().toUpperCase(),
                            style: TextStyle(
                                fontFamily: "Nunitoregular",
                                // fontWeight: FontWeight.w500,
                                color: Color(0xFFC0C0C0),
                                fontSize: screenHeight * 0.03,
                                letterSpacing: -1.0,
                                height: 1.2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      SizedBox(
                        width: screenwidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            model[index!].quote.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              height: 1.2,
                              fontFamily: "Nunitomedium",
                              color: Color(0xFFA5A5A5),
                              fontSize: screenHeight * 0.018,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                  Container(
                    width: screenwidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF202022),
                    ),
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 30),
                    child: SelectableText(
                      scrollPhysics: BouncingScrollPhysics(),
                      toolbarOptions: ToolbarOptions(
                        copy: true,
                        cut: true,
                        paste: true,
                        selectAll: true,
                      ),
                      model[index!].content.toString(),
                      style: TextStyle(
                          fontFamily: "Nunitoregular",
                          color: Color(0xFFA5A5A5),
                          fontSize: screenHeight * 0.02,
                          letterSpacing: 0.5,
                          height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: screenHeight * 0.016,
            left: screenwidth * 0.029,
            right: screenwidth * 0.029,
            // right: 1,
            child: Container(
              width: screenwidth,
              height: screenHeight * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                  // color: Colors.black,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topRight,
                  //   end: Alignment.bottomLeft,
                  //   colors: [
                  //     Color.fromARGB(255, 255, 255, 255),
                  //     Color.fromARGB(255, 255, 255, 255),
                  //   ],
                  // )
                  ),
              child: ElevatedButton(
                onPressed: ()  {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Translation()));
                },
                style: ButtonStyle(
                    shadowColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 20, 20, 22)),
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 20, 20, 22)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                child: Text(
                  "Translate",
                  style: TextStyle(
                      color: Color(0xFFC0C0C0),
                      fontFamily: "Nunitomedium",
                      fontSize: screenwidth * 0.065),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
