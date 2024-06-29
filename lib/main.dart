import 'package:flutter/material.dart';
import 'package:flutter_moi/controllers/popular_product_controller.dart';
import 'package:flutter_moi/pages/home/main_hotel_page.dart';
import 'package:flutter_moi/pages/hotel/popular_hotel_detail.dart';
import 'package:flutter_moi/pages/hotel/recommended_hotel_detail.dart';
import 'package:flutter_moi/routes/route_helper.dart';
import'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import'helper/dependencies.dart' as dep;
import 'home/hotel_page_body.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Flutter',

      home: MainHotelPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

