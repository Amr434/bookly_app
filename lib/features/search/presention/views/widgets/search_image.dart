import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchImage extends StatelessWidget {
final String image;
  const SearchImage(

      {Key? key,
        required this.image

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.6/ 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,

          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}