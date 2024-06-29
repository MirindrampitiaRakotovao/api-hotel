import 'package:flutter_moi/controllers/cart_controller.dart';
import 'package:flutter_moi/controllers/popular_product_controller.dart';
import 'package:flutter_moi/data/repository/cart_repo.dart';
import 'package:flutter_moi/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init()async {
  //apiClient
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));

  //repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}