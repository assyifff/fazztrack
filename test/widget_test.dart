// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fazztrack_batch1/main.dart';

void main() {
  //task 1
  void perulangan(List<int> items) {
    for (var perItem in items) {
      int saved = 1;
      for (var sumItem in items) {
        if (perItem == sumItem) {
          continue;
        }
        saved = saved * sumItem;
        print("$saved");
      }
    }
  }

  perulangan([2, 6, 5, 3]);

  //task 2
  print("===============================");
  void isPalindrome(String word) {
    String reverse = word.split("").reversed.join("");

    if (word == reverse) {
      print("$word => sebuah Palindrome");
    } else {
      print("$word => bukan sebuah Palindrome");
    }
  }

  isPalindrome("syifa");
  isPalindrome("ini");
}
