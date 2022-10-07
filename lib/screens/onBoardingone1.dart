import 'package:flutter/material.dart';

import 'onBoardingone2.dart';

class onBoardingone extends StatelessWidget {
  const onBoardingone({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height; 
    var screenwidth = MediaQuery.of(context).size.width; 
    
    return Scaffold
    (
      backgroundColor: Color.fromARGB(255, 34, 52, 60),
      body: Stack
      (
        children: [
          
          
          Image(image: AssetImage("assets/fs.png"),fit: BoxFit.cover,height: screenHeight,width: screenwidth,),

          Container(
            margin: EdgeInsets.only( left: screenwidth*0.05 , top: screenHeight*0.09 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("To succeed\nyou must\nread.",style: TextStyle(fontFamily: "Gotham",color: Colors.white,fontSize: screenHeight*0.07),),
                SizedBox(height: screenHeight*0.02,),
                Text("-ROBERT T. KIYOSAKI.",style: TextStyle(fontFamily: "Trajan Pro",color: Colors.white,fontSize: screenHeight*0.02),),
                SizedBox(height: screenHeight*0.04,),

                Container(
                  // margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                  width: screenwidth*0.5,
                  decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.white
                      )
                    ]
                  ),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () 
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => onBoardingtwo()));
                      },
                      child: Text("Continue"),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12.0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 34, 52, 60)),
                      )),
                ),
              ],
            ),
          ),
        
        ],
      ),
      
    );
  }
}