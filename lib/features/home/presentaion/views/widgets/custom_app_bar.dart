import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/search/presention/views/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Row(
        children: [
          Image.asset(ConstantData.logoPath, height: 20),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(const SearchScreen());
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
