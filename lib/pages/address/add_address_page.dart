import 'package:flutter/material.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_tct_field.dart';
import 'package:food_app/widgets/icon_tab.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class AddAdressPage extends StatefulWidget {
  const AddAdressPage({super.key});

  @override
  State<AddAdressPage> createState() => _AddAdressPageState();
}

class _AddAdressPageState extends State<AddAdressPage> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height10 * 11,
              decoration: BoxDecoration(color: AppColors.mainColor),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height30 * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      BigText(
                        text: "Add address",
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.height20 * 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: Dimensions.height20 * 7,
              margin: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor, width: 2.5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/map.webp"))),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimensions.width10,
                ),
                IconTab(iconData: Icons.home, color: AppColors.mainColor),
                IconTab(iconData: Icons.work, color: Colors.grey),
                IconTab(iconData: Icons.location_on, color: Colors.grey),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Container(
              width: double.maxFinite,
              height: Dimensions.height30 * 11,
              margin: EdgeInsets.only(left: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigText(text: "Delivery address"),
                  AppTextField(
                      textcontroller: addressController,
                      hintText: "Fill in your address",
                      icon: Icons.location_on),
                  BigText(text: "Contact person name"),
                  AppTextField(
                      textcontroller: nameController,
                      hintText: "Name",
                      icon: Icons.location_on),
                  BigText(text: "Contact person phone"),
                  AppTextField(
                      textcontroller: phoneController,
                      hintText: "Phone",
                      icon: Icons.location_on)
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getInitial());
              },
              child: Container(
                width: Dimensions.screenWidht / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height30),
                    color: AppColors.mainColor),
                child: Center(
                  child: BigText(
                    text: "Save address",
                    size: Dimensions.height20 + Dimensions.height10 / 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
