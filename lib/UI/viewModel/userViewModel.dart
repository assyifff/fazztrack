import 'package:fazztrack_batch1/UI/view/MyHomePage.dart';
import 'package:fazztrack_batch1/core/model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/service/userService.dart';

class UserViewModel extends GetxController {
  UserService service = UserService();
  List<UserModel> user;
  String selectedUser = "";
  bool isBusy = false;
  String handleEmail = "";
  String handlePassword = "";
  String handleUsername = "";
  String inputNumber = "";

  Future getDataUser() async {
    isBusy = true;
    update();
    var response = await service.getUserData();
    user = response;
    isBusy = false;
    update();
  }

  setUser(String value) {
    selectedUser = value;
  }

  emailUser(String email) {
    handleEmail = email;
  }

  passwordUser(String password) {
    handlePassword = password;
  }

  usernameUser(String username) {
    handleUsername = username;
  }

  handleInputNumber(String value) {
    inputNumber = value;
    update();
  }

  userLog(BuildContext context) async {
    var result =
        await service.userLog(email: handleEmail, password: handlePassword);
    if (result.statusCode == 200) {
      getDataUser();
      Get.off(MyHomePage(viewModel: this));
    } else {
      Get.defaultDialog(
        title: "Failed to Login",
      );
    }
  }
}
