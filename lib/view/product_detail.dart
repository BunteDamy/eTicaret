import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:proje/components/custom_button.dart';
import 'package:proje/constant/constant.dart';
import 'package:proje/model/product.dart';

class ProductDetail extends ConsumerStatefulWidget {
  final Product product;
  ProductDetail({required this.product});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              image(),
              title(),
              colors(),
              subDetail(context),
              price(context),
              button(),
            ],
          ),
          appBar(),
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
              padding: [20, 20, 20, 0].paddingLTRB,
              child: CustomButton(onTap: () {}, text: "Add to cart"),
            );
  }

  Padding price(BuildContext context) {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total",
            style: _subTitle,
          ),
          Text(
            "\$${widget.product.price}",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Text(widget.product.title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
    );
  }

  SafeArea appBar() {
    return SafeArea(
      child: Padding(
        padding: 10.horizontalP,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Grock.back(),
              icon: Icon(
                Icons.arrow_back,
                size: 32,
                color: Constant.black,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border_rounded,
                  size: 32,
                  color: Constant.black,
                ))
          ],
        ),
      ),
    );
  }

  Padding subDetail(BuildContext context) {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.descTitle,
            style: _subTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.product.desc,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Padding colors() {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Colors",
            style: _subTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 15,
            children: [
              for (int i = 0; i < widget.product.colors.length; i++)
                Container(
                  width: 113,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: 10.allBR,
                    color: widget.product.colors[i],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      height: 381,
      width: double.maxFinite,
      child: Hero(
          tag: widget.product.image,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.cover,
          )),
    );
  }

  TextStyle _subTitle =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
}
