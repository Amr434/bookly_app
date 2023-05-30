import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_action.dart';
import 'book_rating.dart';
import 'custom_detail_appbar_view.dart';
import 'feature_list_view_item.dart';

class BookDetailSec extends StatelessWidget
{
 final BookModel bookModel;

  const BookDetailSec({Key? key,required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const CustomDetailAppBar(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .15),
          child:  FeatureListViewItem(
              image: bookModel.volumeInfo.imageLinks?.thumbnail??'', raduis: 16, ratio: 2.8),
        ),
        const SizedBox(
          height: 30,
        ),
         Text(
          '${bookModel.volumeInfo.title}',
          style: TextStyles.textStyle30,
           textAlign: TextAlign.center,
           maxLines: 2,
           overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0]??'',
            style: TextStyles.textStyle20.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
       BookRating(
        bookModel: bookModel,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
         BooksAction(bookModel: bookModel),
      ],
    );
  }
}
