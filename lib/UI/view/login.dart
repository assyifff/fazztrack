import 'package:fazztrack_batch1/UI/viewModel/userViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewModel/userViewModel.dart';
import 'signup.dart';

class login extends StatefulWidget {
  const login({Key key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  UserViewModel controller = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserViewModel>(
        builder: (viewModel) {
          return ListView(children: [
            head(),
            //kotak login
            Container(
              height: 611,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  loginLabel(),
                  textLabelLogin(),
                  //textfield email
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        enableSuggestions: false,
                        decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Enter your e-mail",
                            hintStyle: TextStyle(
                              color: Color(0xFFA9A9A9CC).withOpacity(0.8),
                            )),
                        onChanged: (value) {
                          viewModel.emailUser(value);
                        },
                      ),
                    ),
                  ),
                  //textfield password
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      enableSuggestions: false,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9CC).withOpacity(0.8),
                          fontSize: 16,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        ),
                        counterText: "Forgot password?",
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        viewModel.passwordUser(value);
                      },
                    ),
                  ),
                  //button login
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: 343,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GetBuilder<UserViewModel>(
                      builder: (modelView) {
                        return ElevatedButton(
                          onPressed: () async {
                            viewModel.userLog(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF6379F4))),
                        );
                      },
                    ),
                  ),
                  signUpText(),
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

Widget loginLabel() {
  return Container(
    margin: EdgeInsets.only(
      top: 20,
    ),
    child: Text(
      "Login",
      style: TextStyle(
        fontSize: 24,
        color: Color(0xFF3A3D42),
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget textLabelLogin() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Text(
          "Login to your existing account to access",
          style: TextStyle(
            color: Color(0xFF3A3D42).withOpacity(0.6),
            fontSize: 16,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Text(
          "all the features in ZWallet.",
          style: TextStyle(
            color: Color(0xFF3A3D42).withOpacity(0.6),
            fontSize: 16,
          ),
        ),
      )
    ],
  );
}

Widget signUpText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 25),
        child: Text("Don't have an account? Let's "),
      ),
      InkWell(
        onTap: (() {
          Get.off(signUp());
        }),
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            "Sign Up",
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
