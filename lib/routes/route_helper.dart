import 'package:food_app/pages/address/add_address_page.dart';
import 'package:food_app/pages/auth/sign_in_page.dart';
import 'package:food_app/pages/cart/cart_page.dart';
import 'package:food_app/pages/food/popular_food_detail.dart';
import 'package:food_app/pages/food/recommended_food_detail.dart';
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signInPage = "/sign-in-page";
  static const String adsressPage = "/address-page";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';
  static String getSignInPage() => '$signInPage';
  static String getAddressPage() => '$adsressPage';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => HomePage(), transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommendedFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        transition: Transition.fadeIn,
        name: cartPage,
        page: () {
          return CartPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: splashPage,
        page: () {
          return SplashScreen();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: signInPage,
        page: () {
          return SignInPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: adsressPage,
        page: () {
          return AddAdressPage();
        })
  ];
}
