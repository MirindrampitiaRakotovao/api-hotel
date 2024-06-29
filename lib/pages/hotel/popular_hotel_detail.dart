import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moi/controllers/cart_controller.dart';
import 'package:flutter_moi/controllers/popular_product_controller.dart';
import 'package:flutter_moi/pages/home/main_hotel_page.dart';
import 'package:flutter_moi/widget/app_column.dart';
import 'package:flutter_moi/widget/exandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import '../../widget/Icon_and_text_widget.dart';
import '../../widget/app_icon.dart';
import '../../widget/big_text.dart';
import '../../widget/small_text.dart';

class PopularHotelDetail extends StatelessWidget {
  final int pageId;
  const PopularHotelDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());
    //print("page is id"+pageId.toString());
    //print("product name is "+product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                    )
                  )
                ),
          )),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainHotelPage());
                    },
                      child: AppIcon(icon:Icons.arrow_back_ios)
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!,),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "A Propos"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!),
                    )
                    )
                  ],
                ),
              )
          ),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
          decoration: BoxDecoration(
              color: const Color(0xFFf7f6f4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: Colors.black,)
                    ),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                        child: Icon(Icons.add, color: Colors.black,)
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                  child: BigText(text: "\$ ${product.price!} | Réserver l'hôtel", color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: const Color(0xec2f2354),
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}
