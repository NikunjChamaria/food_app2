import 'package:food_app/models/popular_product_models.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedPorductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedPorductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
