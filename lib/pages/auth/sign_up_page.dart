import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/base/custom_loader.dart';
import 'package:food_app/base/show_custom_messgae.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/models/signup_model.dart';
import 'package:food_app/pages/auth/sign_in_page.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_tct_field.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    void _registraion(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password must be more than 6 letters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            email: email, name: name, password: password, phone: phone);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    var signUpImages = ["g1.png", "f.png", "i.png"];
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authcontroller) {
          return !_authcontroller.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.height20 * 4,
                            backgroundImage:
                                AssetImage("assets/images/logo1.png"),
                          ),
                        ),
                      ),
                      AppTextField(
                          textcontroller: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textcontroller: passwordController,
                        hintText: "Password",
                        icon: Icons.password,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                          textcontroller: nameController,
                          hintText: "Name",
                          icon: Icons.person),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                          textcontroller: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registraion(_authcontroller);
                        },
                        child: Container(
                          width: Dimensions.screenWidht / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height30),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                              text: "Sign Up",
                              size: Dimensions.height30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Have any account already?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.height20),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(() => SignInPage(),
                                        transition: Transition.fade),
                                  text: "Sign in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: Dimensions.height20)),
                            ]),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                          text: TextSpan(
                              text:
                                  "Sign up using one of the following methods",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.height16))),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: Dimensions.height30,
                                    backgroundImage: AssetImage(
                                        "assets/images/" + signUpImages[index]),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
