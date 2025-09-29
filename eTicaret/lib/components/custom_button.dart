import 'package:flutter/material.dart';
import 'package:proje/constant/constant.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;  // Updated for better type safety
  final String text;

  CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constant.orange,  // Use backgroundColor instead of primary
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),  // Updated to use BorderRadius.circular(10)
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Constant.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
