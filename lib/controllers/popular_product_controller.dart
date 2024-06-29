import 'package:flutter/material.dart';
import 'package:flutter_moi/controllers/cart_controller.dart';
import 'package:flutter_moi/data/repository/popular_product_repo.dart';
import 'package:flutter_moi/models/products_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList =>_popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;


  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      //print("got products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded=true;
      update();
    }else{

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity(_quantity+1);
    }else{
      _quantity =checkQuantity(_quantity-1);
      print("decrement "+_quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Nombre de chambres", "Vous ne pouvez pas reduire plus !",
      backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Nombre de chambres", "Vous ne pouvez pas en ajouter plus !",
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
  }

  void addItem(ProductModel product){
    if(_quantity>0){
      _cart.addItem(product, _quantity);
      _cart.items.forEach((key, value) {
        print("The id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
    }else{
      Get.snackbar("Nombre de chambres", "Vous devez reserver au moins une chambre !",
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }
  }
}