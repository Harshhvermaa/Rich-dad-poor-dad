import 'package:flutter/material.dart';
import 'package:richdadpoordad/models/citylist.dart';
import 'package:translator/translator.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  String text = "HEllo How are you";
  GoogleTranslator googleTranslator = GoogleTranslator();
  List<City> citylist = cities;
  final items = ["dsf", "fd"];
  String? value;
  TextEditingController _word = TextEditingController();

  String _selectedlanguage1 = "en-English";
  String _selectedlanguage2 = "hi-Hindi";
  String _selectedlanguage1code = "en";
  String _selectedlanguage2code = "hi";
  String _hintText = "Translation";

  Translate() {
    googleTranslator
        .translate(_word.text.toString(),
            from: "${_selectedlanguage1code.toString()}",
            to: "${_selectedlanguage2code.toString()}")
        .then((output) {
      print(output.text);
      setState(() {
        _hintText = output.text.toString();
      });
    });
  }

  // DropdownMenuItem buildMenuItem(String item) =>
  //     DropdownMenuItem(value: items, child: Text(item.toString()));

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    print(_selectedlanguage1);
    print(_selectedlanguage2);
    print(_selectedlanguage1code);
    print(_selectedlanguage2code);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 22),
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 22),
        toolbarHeight: screenHeight * 0.07,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Translate",
              style: TextStyle(
                  fontFamily: "Nunitobold",
                  color: Colors.white,
                  fontSize: screenHeight * 0.03,
                  // letterSpacing: -1.4,
                  height: 1.2),
            ),
          ],
        ),
      ),
      
      body: Container(
        height: screenHeight,
        child: Stack(
          children: [

            SingleChildScrollView(
              child: Column
              (
                children: 
                [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(width: 1, color: Color(0xFF202022))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(12),
                              dropdownColor: Color(0xFF202022),
                              items: citylist.map((index) {
                                int totalitem = citylist.length;
                                int l = index.cityName.toString().length;
                                print(totalitem);
                                return DropdownMenuItem(
                                  value: index.cityName,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      index.cityName.toString().substring(3, l),
                                      style: TextStyle(
                                          fontFamily: "Nunitomedium",
                                          color: Color(0xFFC0C0C0)),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedlanguage1 = value.toString();
                                  _selectedlanguage1code =
                                      value.toString().substring(0, 2);
                                  print(_selectedlanguage1code);
                                  print(_selectedlanguage1);
                                  Translate();
                                });
                              },
                              value: _selectedlanguage1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                String temp1 = _selectedlanguage1code;
                                _selectedlanguage1code = _selectedlanguage2code;
                                _selectedlanguage2code = temp1;
                  
                                String temp2 = _selectedlanguage1;
                                _selectedlanguage1 = _selectedlanguage2;
                                _selectedlanguage2 = temp2;
                              });
                            },
                            child: 
                            Image(
                              image: AssetImage("assets/translate.png"),
                              color: Color(0xFFC0C0C0),
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(width: 1, color: Color(0xFF202022))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(12),
                              dropdownColor: Color(0xFF202022),
                              items: citylist.map((index) {
                                int totalitem = citylist.length;
                                int l = index.cityName.toString().length;
                                print(totalitem);
                                return DropdownMenuItem(
                                  value: index.cityName,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      index.cityName.toString().substring(3, l),
                                      style: TextStyle(
                                          fontFamily: "Nunitomedium",
                                          color: Color(0xFFC0C0C0)),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedlanguage2 = value.toString();
                                  _selectedlanguage2code =
                                      value.toString().substring(0, 2);
                                  print(_selectedlanguage2code);
                                  print(_selectedlanguage2);
                                  Translate();
                                });
                              },
                              value: _selectedlanguage2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: 50,
                  ),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: screenHeight * 0.3,
                          width: screenwidth * 0.42,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF202022),
                              border: Border.all(
                                  width: 1,
                                  color: Color(0xFFC0C0C0).withOpacity(0.08))),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: screenwidth * 0.2),
                            child: TextField(
                              onSubmitted: (value) {
                                Translate();
                              },
                              onChanged: (value) {
                                Translate();
                              },
                              controller: _word,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenwidth * 0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Word",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 5),
                                  hintStyle: TextStyle(
                                      fontFamily: "Nunitomedium",
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                      color: Color(0xFF3A3A3B),
                                      fontSize: _word.text.length > 200
                                          ? screenwidth * 0.04
                                          : screenwidth * 0.05)),
                              maxLines: null,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          // height: screenHeight * 0.3,
                          width: screenwidth * 0.42,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF202022),
                              border: Border.all(
                                  width: 1,
                                  color: Color(0xFFC0C0C0).withOpacity(0.08))),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: screenwidth * 0.2),
                            child: TextField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Nunitomedium"),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: _hintText,
                                  hintMaxLines: 10000,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 5),
                                  // hintMaxLines: TextField.noMaxLength,
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(
                                      fontFamily: "Nunitomedium",
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xFF3A3A3B),
                                      fontSize: _word.text.length > 200
                                          ? screenwidth * 0.04
                                          : screenwidth * 0.05)),
                              maxLines: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Positioned
            (
              bottom: screenwidth * 0.029,
              left: screenwidth * 0.029,
              right: screenwidth * 0.029,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Container(
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
                        Translate();
                      },
                      child: Text(
                        "Translate",
                        style:
                            TextStyle(fontSize: 18, fontFamily: "Nunitomedium"),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12.0),
                        side: MaterialStateProperty.all(BorderSide(
                            color: Color.fromARGB(255, 64, 91, 246), width: 0.5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                        // backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 34, 52, 60)),
                      )),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
