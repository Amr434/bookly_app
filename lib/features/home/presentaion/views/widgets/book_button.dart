import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? fontsize;
  final BorderRadius borderRadius;
  final VoidCallback? onpressed;


  const BookButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.fontsize = 16,
       required this.borderRadius,
         this.onpressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        onPressed: onpressed,
        child: Text(text,
            style: TextStyle(
              color: textColor,
              fontSize: fontsize,
            )),
      ),
    );
  }
}
