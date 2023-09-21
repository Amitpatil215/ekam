import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class HorizontalFullWidthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  const HorizontalFullWidthButton({
    this.text = '',
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.85,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.blue,
              foregroundColor: textColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: TextStyleInventory.reg,
            )),
      ),
    );
  }
}

class HorizontalCustomWidthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  const HorizontalCustomWidthButton({
    this.text = '',
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.blue,
              foregroundColor: textColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: TextStyleInventory.reg,
            )),
      ),
    );
  }
}
