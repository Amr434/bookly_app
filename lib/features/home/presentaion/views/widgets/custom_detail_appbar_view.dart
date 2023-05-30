import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            size: 30,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartShopping,
              size: 30,
            ))
      ],
    );
  }
}
