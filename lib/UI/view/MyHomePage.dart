import 'dart:ffi';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:fazztrack_batch1/UI/viewModel/userViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tampungPageDua = "50.000";
  UserViewModel viewModel = Get.put(UserViewModel());

  @override
  void initState() {
    viewModel.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserViewModel>(builder: (modelView) {
        return modelView.isBusy
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : Container(
                child: ListView(
                  children: [
                    bagianAtas(),
                    balance(),
                    button(),
                    transaction(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: modelView.setData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: 375,
                                  height: 96,
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    onPressed: () {
                                      Get.toNamed('/secondPage');
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 8),
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
                                                      top: 15, right: 67),
                                                  width: 150,
                                                  height: 22,
                                                  child: Text(
                                                    "${modelView.setData[index]['name']}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF4D4B57),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 165, top: 8),
                                                  child: Text(
                                                    "Transfer",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF7A7886),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "${modelView.setData[index]['id'].toString()}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF1EC15F),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}

Widget bagianAtas() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 30,
          right: 20,
        ),
        width: 52,
        height: 52,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            "images/Rectangle 25.png",
          ),
        ),
      ),
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 25,
              right: 44,
              bottom: 8,
            ),
            height: 20,
            width: 120,
            color: Colors.transparent,
            child: Text(
              "Hello,",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            height: 22,
            width: 150,
            color: Colors.transparent,
            child: Text(
              "Robert Chandler",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(
          left: 90,
          top: 20,
        ),
        width: 28,
        height: 28,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            "images/bell.jpg",
          ),
        ),
      )
    ],
  );
}

Widget balance() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 343,
        height: 141,
        // color: Colors.purple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 25,
                left: 41,
              ),
              width: 55,
              height: 19,
              child: Text(
                "Balance",
                style: TextStyle(
                  color: Color(0xFFD0D0D0),
                  fontSize: 14,
                  fontFamily: "NunitoSans",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 41,
              ),
              width: 200,
              height: 33,
              child: Text(
                "Rp120.000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "NunitoSans",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 41,
              ),
              width: 134,
              height: 19,
              child: Text(
                "+62 813-9387-7946",
                style: TextStyle(
                  color: Color(0xFFDFDCDC),
                  fontSize: 14,
                  fontFamily: "NunitoSans",
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color(0xFF6379F4),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      )
    ],
  );
}

Widget button() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 162,
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFEAEDFF),
        ),
        margin: EdgeInsets.only(right: 8),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_upward,
            color: Color(0xFF514F5B),
          ),
          label: Text(
            "Transfer",
            style: TextStyle(
              fontFamily: "NunitoSans",
              fontSize: 18,
              color: Color(0xFF514F5B),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFFEAEDFF),
            ),
          ),
        ),
      ),
      Container(
        width: 162,
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFEAEDFF),
        ),
        margin: EdgeInsets.only(left: 8),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Color(0xFF514F5B),
          ),
          label: Text(
            "Top Up",
            style: TextStyle(
              fontFamily: "NunitoSans",
              fontSize: 18,
              color: Color(0xFF514F5B),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFFEAEDFF),
            ),
          ),
        ),
      )
    ],
  );
}

Widget transaction() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(top: 25, left: 24, bottom: 25),
        child: Text(
          "Transaction History",
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 18,
            color: Color(0xFF514F5B),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 25, right: 24, bottom: 25),
        child: Text(
          "See all",
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 14,
            color: Color(0xFF6379F4),
          ),
        ),
      )
    ],
  );
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       margin: EdgeInsets.only(top: 20),
//       color: Colors.white,
//       width: 375,
//       height: 96,
//       child: ElevatedButton(
//         onPressed: () async {
//           var result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SecondPage(),
//             ),
//           );
//           setState(() {
//             tampungPageDua = result;
//           });
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 10),
//               width: 56,
//               height: 56,
//               child: Image(
//                 image: AssetImage(
//                   "images/1.png",
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(
//                       right: 100,
//                       top: 25,
//                     ),
//                     width: 92,
//                     height: 22,
//                     child: Text(
//                       "Samuel Suhi",
//                       style: TextStyle(
//                         fontFamily: "NunitoSans",
//                         fontSize: 16,
//                         color: Color(0xFF4D4B57),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                       right: 139,
//                       top: 8,
//                     ),
//                     width: 52,
//                     height: 19,
//                     child: Text(
//                       "Transfer",
//                       style: TextStyle(
//                         fontFamily: "NunitoSans",
//                         fontSize: 14,
//                         color: Color(0xFF7A7886),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(right: 10),
//               child: Text(
//                 "+$tampungPageDua",
//                 style: TextStyle(
//                   fontFamily: "NunitoSans",
//                   fontSize: 18,
//                   color: Color(0xFF1EC15F),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   ],
// ),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       margin: EdgeInsets.only(top: 20),
//       color: Colors.white,
//       width: 375,
//       height: 96,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               color: Color(0xFFEBEEF2),
//             ),
//             child: Image(
//               fit: BoxFit.contain,
//               image: AssetImage(
//                 "images/spotify.png",
//               ),
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 100,
//                     top: 25,
//                   ),
//                   width: 92,
//                   height: 22,
//                   child: Text(
//                     "Spotify",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 18,
//                       color: Color(0xFF4D4B57),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 112,
//                     top: 8,
//                   ),
//                   width: 80,
//                   height: 19,
//                   child: Text(
//                     "Subscription",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 14,
//                       color: Color(0xFF7A7886),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             child: Text(
//               "-49.000",
//               style: TextStyle(
//                 fontFamily: "NunitoSans",
//                 fontSize: 18,
//                 color: Color(0xFFFF5B37),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ],
// ),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       margin: EdgeInsets.only(top: 20),
//       color: Colors.white,
//       width: 375,
//       height: 96,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               color: Color(0xFFEBEEF2),
//             ),
//             child: Image(
//               fit: BoxFit.contain,
//               image: AssetImage(
//                 "images/netflix.png",
//               ),
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 85,
//                     top: 25,
//                   ),
//                   width: 92,
//                   height: 22,
//                   child: Text(
//                     "Netflix",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 18,
//                       color: Color(0xFF4D4B57),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 96,
//                     top: 8,
//                   ),
//                   width: 80,
//                   height: 19,
//                   child: Text(
//                     "Subscription",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 14,
//                       color: Color(0xFF7A7886),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             child: Text(
//               "-149.000",
//               style: TextStyle(
//                 fontFamily: "NunitoSans",
//                 fontSize: 18,
//                 color: Color(0xFFFF5B37),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ],
// ),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       margin: EdgeInsets.only(top: 20),
//       color: Colors.white,
//       width: 375,
//       height: 96,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 10),
//             width: 56,
//             height: 56,
//             child: Image(
//               image: AssetImage(
//                 "images/1-1.png",
//               ),
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 40,
//                     top: 25,
//                   ),
//                   width: 120,
//                   height: 22,
//                   child: Text(
//                     "Bobi Sammy",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 18,
//                       color: Color(0xFF4D4B57),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     right: 105,
//                     top: 8,
//                   ),
//                   width: 52,
//                   height: 19,
//                   child: Text(
//                     "Transfer",
//                     style: TextStyle(
//                       fontFamily: "NunitoSans",
//                       fontSize: 14,
//                       color: Color(0xFF7A7886),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             child: Text(
//               "+1.150.000",
//               style: TextStyle(
//                 fontFamily: "NunitoSans",
//                 fontSize: 18,
//                 color: Color(0xFF1EC15F),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ],
// )