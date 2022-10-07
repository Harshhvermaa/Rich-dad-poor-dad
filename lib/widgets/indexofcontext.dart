import 'package:flutter/material.dart';

import '../models/model.dart';
import '../screens/content.dart';

class indexofcontent extends StatelessWidget {
  indexofcontent({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
          itemCount: model.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // print(model.length);
            return Padding(
              padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 10,
                  bottom: index == model.length - 1 ? 50 : 0),
              child: Container(
                transform: Matrix4.translationValues(0.0, -screenHeight*0.03, 0.0),
                // margin: EdgeInsets.only( bottom:  index == model.length ? 50 : 0 ),
                width: screenwidth * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // boxShadow: [
                  //   BoxShadow(
                  //       offset: Offset(4, 4),
                  //       color:
                  //           Color.fromARGB(255, 34, 52, 60).withOpacity(0.5))
                  // ]
                ),
                height:70,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Content(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: index == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model[index].title.toString(),
                                    style: TextStyle(
                                        fontFamily: "Nunitomedium",
                                        color: Color(0xFF3A3A3B),
                                        fontSize: screenHeight * 0.022,
                                        letterSpacing: 0,
                                        height: 1.2),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    model[index].lesson.toString().length > 30
                                        ? model[index]
                                                .lesson
                                                .toString()
                                                .substring(0, 28) +
                                            "..."
                                        : model[index].lesson.toString(),
                                    style: TextStyle(
                                        fontFamily: "Nunitomedium",
                                        color: Color(0xFFC0C0C0),
                                        fontSize: screenHeight * 0.023,
                                        letterSpacing: 0,
                                        height: 1.2),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                height: screenHeight * 0.06,
                                width: screenwidth * 0.13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  // image: DecorationImage(),
                                  color: Color(0xFF19191B),
                                ),
                                child: Image(
                                  image: AssetImage("assets/info.png"),
                                  color: Color(0xFF3A3A3B)
                                      .withOpacity(0.8),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model[index].title.toString(),
                                    style: TextStyle(
                                        fontFamily: "Nunitomedium",
                                        color: Color(0xFF3A3A3B),
                                        fontSize: screenHeight * 0.022,
                                        letterSpacing: 0,
                                        height: 1.2),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    model[index].lesson.toString().length > 30
                                        ? model[index]
                                                .lesson
                                                .toString()
                                                .substring(0, 28) +
                                            "..."
                                        : model[index].lesson.toString(),
                                    style: TextStyle(
                                        fontFamily: "Nunitomedium",
                                        color: Color(0xFFC0C0C0),
                                        fontSize: screenHeight * 0.023,
                                        letterSpacing: 0,
                                        height: 1.2),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(12.0),
                      // side: MaterialStateProperty.all(
                      //     BorderSide(color: Colors.white, width: 0.5)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF202022)),
                    )),
              ),
            );
          }),
    );
  }
}
