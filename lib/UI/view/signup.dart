import 'package:fazztrack_batch1/UI/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewModel/userViewModel.dart';

class signUp extends StatefulWidget {
  const signUp({Key key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  UserViewModel viewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserViewModel>(
        builder: (state) {
          return ListView(children: [
            head(),
            Container(
              //kotak sign up
              height: 611,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  signUpTitle(),
                  signUpSubTitle(),
                  usernameField(),
                  emailField(),
                  passwordField(),
                  //kotak button
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
                            Get.off(login());
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
                  loginText(),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

Widget head() {
  return Row(
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
  );
}

Widget signUpTitle() {
  return Container(
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
  );
}

Widget signUpSubTitle() {
  return Column(
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
  );
}

Widget usernameField() {
  return Padding(
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
  );
}

Widget emailField() {
  return Padding(
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
  );
}

Widget passwordField() {
  return Padding(
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
  );
}

Widget loginText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 25),
        child: Text("Already have an account? Let’s "),
      ),
      InkWell(
        onTap: (() {
          Get.off(login());
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
  );
}
