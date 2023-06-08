import 'package:flutter/material.dart';
import 'package:food_app/pages/home/food_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_Text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularPorductController>().getPopularProductList();
    await Get.find<RecommendedPorductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    //print(Dimensions.listViewImgSize);
    //print(MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        onRefresh: _loadResource,
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height30 + Dimensions.height30 / 2,
                    bottom: Dimensions.height30 / 2),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "India",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Kolkata",
                              color: Colors.black54,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: const SingleChildScrollView(child: FoodPageBody())),
          ],
        ));
  }
}
