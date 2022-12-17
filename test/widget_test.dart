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

  //2 6 5 3
  //2 6 5 3
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

  palindrome(String inputanValue) {
    for (var i = 0; i < inputanValue.length; i++) {
      var firstIndex = i;
      var lastIndex = print("");
    }
  }
}
