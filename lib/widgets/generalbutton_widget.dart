import 'package:flutter/material.dart';

class GeneralButtonWidget extends StatelessWidget {
  final double height;
  final VoidCallback onPressed;
  final String text;
  final double? generalPadding;
  final Color color;

  const GeneralButtonWidget({
    // Required parameters
    required this.height,
    required this.onPressed,
    required this.text,
    required this.color,
    // Optional parameters
    this.generalPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onPressed,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              height * (generalPadding ?? 0.02),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * (generalPadding ?? 0.02),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
