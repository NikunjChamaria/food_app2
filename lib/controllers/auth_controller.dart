import 'package:food_app/data/repository/auth_repo.dart';
import 'package:food_app/models/response_model.dart';
import 'package:food_app/models/signup_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthReppo authReppo;
  AuthController({required this.authReppo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response respone = await authReppo.registration(signUpBody);
    //print("yo yo" + respone.statusCode.toString());
    late ResponseModel responseModel;
    if (respone.statusCode == 200) {
      authReppo.saveUserToken(respone.body["token"]);
      responseModel = ResponseModel(true, respone.body["token"]);
    } else {
      responseModel = ResponseModel(false, respone.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response respone = await authReppo.login(email, password);
    print("yo yo" + respone.statusCode.toString());
    late ResponseModel responseModel;
    if (respone.statusCode == 200) {
      print("yo");
      authReppo.saveUserToken(respone.body["token"]);
      print(respone.body["token"].toString());
      responseModel = ResponseModel(true, respone.body["token"]);
    } else {
      print(respone.body["token"].toString());
      responseModel = ResponseModel(false, respone.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) async {
    authReppo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authReppo.userLoggedIn();
  }

  bool clearsharedData() {
    return authReppo.clearSharedData();
  }
}
