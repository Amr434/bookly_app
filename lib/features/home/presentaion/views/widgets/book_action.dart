import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book_button.dart';

class BooksAction extends StatelessWidget {
  final BookModel bookModel;
  const BooksAction({Key? key,required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children:  [
          const Expanded(
            child: BookButton(
              textColor: Colors.black,
              backgroundColor: Colors.white,
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              fontsize: 25,
            ),
          ),
          Expanded(
            child: BookButton(
              onpressed: () async
              {
                if (await canLaunchUrl(Uri.parse(bookModel.volumeInfo.previewLink!))) {
                 launchUrl(Uri.parse(bookModel.volumeInfo.previewLink!));
                }
              },
              textColor: Colors.white,
              backgroundColor:const Color(0xffEF8262),
              text: 'Preview',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              fontsize: 20,
            ),
          )
        ],
      ),
    );
  }
}
