import 'package:flutter_moi/pages/home/main_hotel_page.dart';
import 'package:flutter_moi/pages/hotel/popular_hotel_detail.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/hotel/recommended_hotel_detail.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularHotel="/popular-hotel";
  static const String recommendedHotel="/recommended-hotel";

  static String getInitial()=>'$initial';
  static String getPopularHotel(int pageId)=>'$popularHotel?pageId=$pageId';
  static String getRecommendedHotel(int pageId)=>'$recommendedHotel?pageId=$pageId';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainHotelPage()),

    GetPage(name: popularHotel, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularHotelDetail(pageId:int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedHotel, page: (){
      var pageId=Get.parameters['pageId'];
      return RecommendedHotelDetail(pageId:int.parse(pageId!));
    },
        transition: Transition.fadeIn
    ),

  ];
}