import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerWidget({Key? key, required this.width, required this.height}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]??Colors.grey,
      highlightColor: Colors.grey[50]??Colors.grey,
      child: Container(
        margin:const EdgeInsets.only(right: 20),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}