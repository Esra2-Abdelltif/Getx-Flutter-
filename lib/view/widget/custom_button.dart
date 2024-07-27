import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double? width;

  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.width
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ??double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child:Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}