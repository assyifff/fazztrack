import 'package:fazztrack_batch1/core/model/userModel.dart';
import 'package:dio/dio.dart';

class UserService {
  var _dio = Dio();
  Future<List<UserModel>> getUserData() async {
    try {
      var response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");
      print("respon sukses: $response");
      List<UserModel> _model =
          List<UserModel>.from(response.data.map((e) => UserModel.fromJson(e)));
      return _model;
    } catch (e) {
      print("Error di $e");
      throw Error();
    }
  }

  Future userLog({email: String, password: String}) async {
    try {
      var response = await _dio.post("http://23.20.237.176:8000/auth/login",
          data: {"email": email, "password": password});
      return response;
    } catch (e) {
      print("Error di $e");
      return DioError(requestOptions: e);
    }
  }
}
