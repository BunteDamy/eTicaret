import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proje/assets.dart';
import 'package:proje/constant/constant.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String appbarTitle;

  CustomAppbar({Key? key, this.appbarTitle = "iDrip"})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.darkWhite,
      elevation: 4, 
      leading: Padding(
        padding: EdgeInsets.all(10), 
        child: SvgPicture.asset(
          Assets.icons.icDrawerSVG,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(10), 
          child: SvgPicture.asset(
            Assets.icons.icSearchSVG,
          ),
        ),
      ],
      title: null, 
      flexibleSpace: Center( 
        child: Text(
          appbarTitle,
          style: const TextStyle(
            color: Constant.black,
            fontWeight: FontWeight.bold,
            fontSize: 20, 
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0), 
        child: Container(
          color: Colors.grey.shade300, 
          height: 1.0, 
        ),
      ),
    );
  }
}
