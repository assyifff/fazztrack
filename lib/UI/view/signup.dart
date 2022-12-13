import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../viewModel/userViewModel.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  UserViewModel viewModel = Get.put(UserViewModel());

  @override
  void initState() {
    viewModel.postDataToApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserViewModel>(
        builder: (state) {
          return ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "ZWallet",
                    style: TextStyle(
                      color: Color(0xFF6379F4),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    top: 105,
                    bottom: 61,
                  ),
                )
              ],
            ),
            Container(
              height: 611,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF3A3D42),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          "Create your account to access Zwallet.",
                          style: TextStyle(
                            color: Color(0xFF3A3D42).withOpacity(0.6),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        enableSuggestions: false,
                        decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_sharp),
                            hintText: "Enter your username",
                            hintStyle: TextStyle(
                              color: Color(0xFFA9A9A9CC).withOpacity(0.8),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      child: TextFormField(
                        enableSuggestions: false,
                        decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Enter your e-mail",
                            hintStyle: TextStyle(
                              color: Color(0xFFA9A9A9CC).withOpacity(0.8),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      enableSuggestions: false,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Create your password",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9CC).withOpacity(0.8),
                          fontSize: 16,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                      // obscuringCharacter: '*',
                      // obscureText: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    width: 343,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GetBuilder<UserViewModel>(
                      builder: (modelView) {
                        return ElevatedButton(
                          onPressed: () {
                            Get.offNamed("/");
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF6379F4))),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text("Already have an account? Let’s "),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed("/");
                        }),
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFF6379F4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}
