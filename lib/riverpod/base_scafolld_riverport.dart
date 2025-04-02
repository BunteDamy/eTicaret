import 'package:flutter/material.dart';
import 'package:proje/assets.dart';
import 'package:proje/model/bottom_nav_bar_model.dart';
import 'package:proje/view/account.dart';
import 'package:proje/view/cart.dart';
import 'package:proje/view/category.dart';
import 'package:proje/view/home.dart';
import 'package:proje/view/whislist.dart';

class BaseScafolldRiverport extends ChangeNotifier {
    List<BottomNavBarModel> items = [
      BottomNavBarModel(image: Assets.icons.icBottomHomeSVG, title: "Home"),
      BottomNavBarModel(image: Assets.icons.icBottomSaveSVG, title: "Whishlist"),
      BottomNavBarModel(image: Assets.icons.icBottomCategoriesSVG, title: "Category"),
      BottomNavBarModel(image: Assets.icons.icBottomProfileSVG, title: "Account"),
      BottomNavBarModel(image: Assets.icons.icBottomCartSVG, title: "Cart"),

    ];


  int currentIndex = 0;


  void setCurrentIndex(int index) {
    currentIndex =index;
    notifyListeners();
  }


  Widget body(){
    switch(currentIndex){
      case 0: return Home();
      case 1: return Wishlist();
      case 2: return Category();
      case 3: return Account();
      case 4: return Cart();
      default: return Home();
    }
  }
}