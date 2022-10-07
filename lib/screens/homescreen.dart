import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:richdadpoordad/global.dart';
import 'package:richdadpoordad/models/model.dart';
import 'package:richdadpoordad/screens/content.dart';
import 'package:richdadpoordad/widgets/appbarofficial.dart';
import 'package:richdadpoordad/widgets/indexofcontext.dart';
import 'package:richdadpoordad/widgets/slider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Get.defaultDialog(
  //       title: "What shall i call you",
  //       content: Column(
  //         children: [
  //           TextField(),
  //           ElevatedButton(onPressed: (){}, child: Text("Submit"))
  //         ],
  //       ),
  //     );  
    

  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    String? username = sharedPreferences!.getString("Username");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 22),
      body: Column(
        children: [
          appbarOfficial(),
          SliderM(),
          indexofcontent()
        ],
      ),
    );
  }
}
