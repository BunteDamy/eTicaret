import 'package:flutter/material.dart';

class Product {
  final int id;  // final yapıldı
  final String image;  // final yapıldı
  final String title;  // final yapıldı
  final int price;  // final yapıldı
  final double star;  // final yapıldı
  final String descTitle;  // final yapıldı
  final String desc;  // final yapıldı
  final List<Color> colors;  // final yapıldı
  final bool isSaved;  // final yapıldı

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.descTitle,
    required this.desc,
    required this.colors,
    required this.isSaved,
  });

  // copyWith metodu ekleniyor
  Product copyWith({
    int? id,
    String? image,
    String? title,
    int? price,
    double? star,
    String? descTitle,
    String? desc,
    List<Color>? colors,
    bool? isSaved,
  }) {
    return Product(
      id: id ?? this.id,  // Eğer parametre null değilse, onu al, yoksa mevcut değeri kullan
      image: image ?? this.image,
      title: title ?? this.title,
      price: price ?? this.price,
      star: star ?? this.star,
      descTitle: descTitle ?? this.descTitle,
      desc: desc ?? this.desc,
      colors: colors ?? this.colors,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
