import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../core/service/userService.dart';

class UserViewModel extends GetxController {
  String inputUsernameFromReactive = "";
  String inputPasswordFromReactive = "";

  handleInputUsername(String value) {
    inputUsernameFromReactive = value;
    update();
  }

  handleInputPassword(String value) {
    inputPasswordFromReactive = value;
    update();
  }

  late UserService service;
  List setData = [];
  var _dio = Dio();
  bool isBusy = false;

  Future getDataFromApi() async {
    isBusy = true;
    var result = await _dio.get("https://jsonplaceholder.typicode.com/users");
    print("disini result ${result.data}");
    setData = result.data;
    isBusy = false;
    update();
  }

  Future postDataToApi({String? email, String? password}) async {
    var result = await _dio.post("http://23.20.237.176:8000/auth/login",
        data: {"email": email, "password": password});
    return result;
  }
}
