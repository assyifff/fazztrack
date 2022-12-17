import 'package:fazztrack_batch1/UI/viewModel/userViewModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final UserViewModel viewModel;
  const SecondPage({Key key, this.viewModel}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserViewModel>(
        builder: (viewModel) {
          return ListView(
            children: [
              buatKembali(),
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
                        assetimage(),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 23,
                                ),
                                child: Text(
                                  widget.viewModel.selectedUser,
                                  style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              phoneNumber(),
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
                      "Rp120.000 Available ${widget.viewModel.inputNumber}",
                      style: TextStyle(
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
                            fontSize: 42,
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: "NunitoSans",
                          fontSize: 42,
                        ),
                        cursorColor: Color(0xFFFF5B37),
                        onChanged: ((value) {
                          viewModel.handleInputNumber(value);
                        }),
                      ),
                    ),
                  ),
                  notes(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget buatKembali() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: IconButton(
          onPressed: () {
            Get.back();
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
  );
}

Widget notes() {
  return Padding(
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
  );
}

Widget assetimage() {
  return Container(
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
  );
}

phoneNumber() {
  return Container(
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
  );
}
