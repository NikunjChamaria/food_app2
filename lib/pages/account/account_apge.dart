import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/base/custom_loader.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/user_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/account_widget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (usercontroller) {
          return _userLoggedIn
              ? (usercontroller.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          AppIcon(
                            icon: Icons.person,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            iconSize: Dimensions.height30 * 2.5,
                            size: Dimensions.height30 * 5,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.person,
                                        iconColor: Colors.white,
                                        backgroundColor: AppColors.mainColor,
                                        iconSize: Dimensions.height10 * 2.5,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text: usercontroller.userModel.name)),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.phone,
                                        iconColor: Colors.white,
                                        backgroundColor: AppColors.yellowColor,
                                        iconSize: Dimensions.height10 * 2.5,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              usercontroller.userModel.phone)),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.email,
                                        iconColor: Colors.white,
                                        backgroundColor: AppColors.yellowColor,
                                        iconSize: Dimensions.height10 * 2.5,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              usercontroller.userModel.email)),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getAddressPage());
                                    },
                                    child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          iconColor: Colors.white,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconSize: Dimensions.height10 * 2.5,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                            text: "Fill in your address")),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.message,
                                        iconColor: Colors.white,
                                        backgroundColor: Colors.redAccent,
                                        iconSize: Dimensions.height10 * 2.5,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(text: "Messages")),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearsharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHIstory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.logout,
                                          iconColor: Colors.white,
                                          backgroundColor: Colors.redAccent,
                                          iconSize: Dimensions.height10 * 2.5,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(text: "Log Out")),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/sign.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height20),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.height26,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }));
  }
}
