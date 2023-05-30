import 'package:bookly_app/core/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureListViewItem extends StatelessWidget {
  final double ratio;
  final String image;
  final double raduis;

  const FeatureListViewItem(
      {Key? key,
      required this.image,
      required this.raduis,
      required this.ratio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(raduis),
      child: AspectRatio(
        aspectRatio: ratio / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,

          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
