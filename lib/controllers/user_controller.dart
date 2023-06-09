import 'package:food_app/data/repository/auth_repo.dart';
import 'package:food_app/data/repository/user_repo.dart';
import 'package:food_app/models/response_model.dart';
import 'package:food_app/models/signup_model.dart';
import 'package:food_app/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response respone = await userRepo.getUserInfo();
    //print("yo yo" + respone.statusCode.toString());
    late ResponseModel responseModel;
    if (respone.statusCode == 200) {
      _isLoading = true;
      _userModel = UserModel.fromJson(respone.body);
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, respone.statusText!);
    }

    update();
    return responseModel;
  }
}
