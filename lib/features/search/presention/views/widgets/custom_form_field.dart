import 'package:bookly_app/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  final ValueChanged<String>? onchange ;

  const CustomTextFormField({Key? key, this.onchange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return TextFormField(
      controller: textEditingController,
      autofocus: true,
      onEditingComplete: () {},
      onFieldSubmitted: (String val) {
      },
      onChanged: onchange,
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintText: 'Search',
          suffixIcon: const Icon(

            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white
          )),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Colors.white,
    ));
