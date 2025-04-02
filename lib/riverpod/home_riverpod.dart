import 'package:flutter/material.dart';
import 'package:proje/assets.dart';
import 'package:proje/model/home_products_model.dart';
import 'package:proje/model/product.dart';

class HomeRiverpod extends ChangeNotifier {
  List<String> campaigns = [
    Assets.images.imCampaignPNG, 
    Assets.images.imCampaignnPNG, 
    Assets.images.imCampaignPNG, 
  ];


  int campaingsCurrentIndex = 0;

  PageController pageController = PageController(initialPage: 0);


  void setCampaingsIndex(int newPageValue){
    campaingsCurrentIndex = newPageValue;
    notifyListeners();
  }


HomeProductsModel hotDeals = 
  HomeProductsModel(
    categoryTitle: "Hot Deals", products:[
      Product(
        id:1,
        image: Assets.images.c1PNG, 
        title: "apple IMac 24 (2021)", 
        price: 1299, 
        star: 4.9,
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: false),
      
      Product(
        id:2,
        image: Assets.images.w1PNG, 
        title: "Apple Watch V1", 
        price: 859, 
        star: 4.7, 
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: true),
      
      Product(
        id:3,
        image: Assets.images.p1PNG, 
        title: "Apple Iphone 12 Series", 
        price: 1199, 
        star: 5.0, 
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: false),
        ]);

HomeProductsModel mostPopular = 
  HomeProductsModel(
    categoryTitle: "Most Popular", products:[
      Product(
        id:4,
        image: Assets.images.c2PNG, 
        title: "apple IMac 30 (2018)", 
        price: 1000, 
        star: 4.9, 
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: true),
      
      Product(
        id:5,
        image: Assets.images.w2PNG, 
        title: "Apple Watch V2", 
        price: 1099, 
        star: 4.9, 
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: false),
      
      Product(
        id:6,
        image: Assets.images.p1PNG, 
        title: "Apple Iphone 13 Pro Max", 
        price: 1400, 
        star: 5.0, 
        colors: [Colors.cyan, Colors.deepPurple, Colors.green],
        descTitle: "Get Apple TV+ free for a year",
        desc: "Ipad Air. With a stunning 10.9-inch Liquid Retine display and Tru TOne for a more",
        isSaved: true),
        ]);


}


