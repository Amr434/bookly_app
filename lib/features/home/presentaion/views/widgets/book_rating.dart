import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final BookModel? bookModel;
  const BookRating(
      {Key? key, this.mainAxisAlignment = MainAxisAlignment.start, this.bookModel})
      : super(key: key);
  final mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
          size: 14,
        ),
       const  SizedBox(
          width: 5,
        ),
         Text(
          '${bookModel?.volumeInfo.averageRating??0}',
          style: TextStyles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
            opacity: .5,
            child: Text(
              '(${ bookModel?.volumeInfo.ratingsCount??0})',
              style: TextStyles.textStyle14,
            )),
      ],
    );
  }
}
