import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:richdadpoordad/screens/homescreen.dart';
import 'package:richdadpoordad/screens/onBoardingone1.dart';
import 'package:richdadpoordad/screens/onBoardingone2.dart';

import '../global.dart';

class appbarOfficial2 extends StatelessWidget {
  // String? username;
  appbarOfficial2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    String? username = sharedPreferences!.getString("Username");
    return Container(
      // margin: EdgeInsets.only(top:  screenHeight * 0.05,left: 10,right: 10),
      height: screenHeight * 0.1456,
      width: screenwidth,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 20, 20, 22),
      ),
      child: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: screenHeight * 0.05, left: 12, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to( () => Homescreen() );
                    
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // image: DecorationImage(),
                      color: Color.fromARGB(255, 32, 32, 34),
                    ),
                    child: Image(
                      image: AssetImage("assets/Vector.png"),
                      color:
                          Color.fromARGB(255, 192, 192, 192).withOpacity(0.8),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hey,",
                      style: TextStyle(
                          fontFamily: "Nunitomedium",
                          color: Color.fromARGB(255, 58, 58, 59),
                          fontSize: 20,
                          // fontWeight: FontWeight.w00,
                          // letterSpacing: ,
                          height: 1.2),
                    ),
                    Text(
                      username!.length > 15 ? "${ username.substring(0,10).toLowerCase() + "..." }" : username.toLowerCase(),
                      style: TextStyle(
                          fontFamily: "Nunitomedium",
                          color: Color(0xFFC0C0C0),
                          fontSize: 22,
                          // fontWeight: FontWeight.w00,
                          // letterSpacing: ,
                          height: 1.2),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Color(0xFF202022),
          ),
        ],
      ),
    );
  }
}
