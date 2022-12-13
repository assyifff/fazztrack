import 'dart:ui';

import 'MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String inputNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context, inputNumber);
                    print(inputNumber);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Container(
                child: Text(
                  "Transfer",
                  style: TextStyle(
                    fontFamily: "NunitoSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 343,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 16,
                      ),
                      width: 56,
                      height: 56,
                      child: Image(
                        image: AssetImage(
                          "images/1.png",
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 27,
                              top: 23,
                            ),
                            child: Text(
                              "Samuel Suhi",
                              style: TextStyle(
                                fontFamily: "NunitoSans",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 15,
                              top: 9,
                            ),
                            child: Text(
                              "+62 813-8492-9994",
                              style: TextStyle(
                                fontFamily: "NunitoSans",
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                ),
                child: Text(
                  "Rp120.000 Available $inputNumber",
                  style: TextStyle(
                    fontFamily: "NunitoSans",
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: new InputDecoration(
                      hintText: "0.00",
                      hintStyle: TextStyle(
                        fontFamily: "NunitoSans",
                        fontSize: 42,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: "NunitoSans",
                      fontSize: 42,
                    ),
                    cursorColor: Color(0xFFFF5B37),
                    onChanged: ((value) {
                      setState(() {
                        inputNumber = value;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: TextFormField(
                    enableSuggestions: false,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.edit,
                        ),
                        hintText: "Add some notes",
                        hintStyle: TextStyle(
                          fontFamily: "NunitoSans",
                        )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
