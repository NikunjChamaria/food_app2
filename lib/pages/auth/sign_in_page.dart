import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/base/custom_loader.dart';
import 'package:food_app/pages/auth/sign_up_page.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_tct_field.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custom_messgae.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password must be more than 6 letters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            print("yo");
            Get.toNamed(RouteHelper.getInitial());
            //Get.toNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authcontroller) {
          return !authcontroller.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
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
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: Dimensions.height20 * 3 +
                                    Dimensions.height20 / 2,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Sign in to your account",
                            style: TextStyle(
                                fontSize: Dimensions.height20,
                                color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height24,
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
                    Row(
                      children: [
                        Expanded(child: Container()),
                        RichText(
                            text: TextSpan(
                                text: "Sign in to your account",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.height20))),
                        SizedBox(
                          width: Dimensions.height10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _login(authcontroller);
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
                            text: "Sign In",
                            size: Dimensions.height30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don\'t have an account",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.height16),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUpPage(),
                                      transition: Transition.fade),
                                text: "Create",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.height16)),
                          ]),
                    ),
                  ]),
                )
              : CustomLoader();
        }));
  }
}
