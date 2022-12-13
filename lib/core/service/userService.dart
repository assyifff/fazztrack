import 'package:fazztrack_batch1/core/model/userModel.dart';
import 'package:fazztrack_batch1/core/repository/userRepository.dart';

class UserService {
  UserRepository userRepo = UserRepository();
  Future<List> getUser() async {
    print("masuk kesini");
    var result = await UserRepository().getDataFromApi();
    print("resultnya $result");
    return result;
  }

  Future userLog() async {
    var res = await UserRepository().postDataToApi();
    return res;
  }
}
