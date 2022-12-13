import 'package:fazztrack_batch1/UI/view/MyHomePage.dart';
import 'package:fazztrack_batch1/UI/viewModel/userViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../viewModel/userViewModel.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var inputUser = "";
  UserViewModel postView = Get.put(UserViewModel());

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
                      "Login",
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
                  ),
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
                      ),
                    ),
                  ),
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
                      obscuringCharacter: '*',
                      obscureText: true,
                    ),
                  ),
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
                            var res = await postView.postDataToApi(
                                email: "lukmanssefriyanto@gmail.com",
                                password: "test123456");
                            if (res.statusCode == 200) {
                              Get.offNamed('/homePage');
                            } else {
                              AlertDialog(
                                title: Text("Failed login"),
                              );
                            }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text("Don't have an account? Let's "),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed("/signIn");
                        }),
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFF6379F4),
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
