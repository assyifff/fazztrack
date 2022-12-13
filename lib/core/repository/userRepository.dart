import 'package:dio/dio.dart';
import 'package:fazztrack_batch1/core/model/userModel.dart';

class UserRepository {
  var _dio = Dio();
  Future<List> getDataFromApi() async {
    print("masuk ke repo");
    List setData = [];
    var result = await _dio.get("https://jsonplaceholder.typicode.com/users");
    setData.add(result.data);
    return setData[0];
  }

  Future postDataToApi({String? email, String? password}) async {
    var result = await _dio.post("http://23.20.237.176:8000/auth/login",
        data: {"email": email, "password": password});
    return result;
  }
}
