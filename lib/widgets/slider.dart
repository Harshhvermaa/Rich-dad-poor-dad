import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderM extends StatelessWidget {
  SliderM({super.key});
  final items = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 14),
      child: CarouselSlider(
        options: CarouselOptions(
          // height: MediaQuery.of(context).size.height * 0.2,

          // aspectRatio: 16 / 8,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          autoPlayCurve: Curves.decelerate,
          // enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: items.map((index) {
          // var url =  index["SliderImageUrl"];
          // print("$url");
          // var data = slidesList[index];
          // print(slidesList[index]);
          // print(slidesList[index] + "dsf");
          return Builder(builder: (BuildContext context) {
            return Container(
               margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(index), fit: BoxFit.cover)),
              // child: CachedNetworkImage(imageUrl: url,fit: BoxFit.cover,),
            );
          });
        }).toList(),
      ),
    );
  }
}
