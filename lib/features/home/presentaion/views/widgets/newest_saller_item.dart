import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/views/book_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'feature_list_view_item.dart';

class NewestSallerItem extends StatelessWidget {
  const NewestSallerItem({Key? key,required this.bookModel}) : super(key: key);
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to( BookDetailView(bookModel: bookModel,));
      },
      child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 150,
          child: Row(
            children: [
               FeatureListViewItem(
                image: bookModel.volumeInfo.imageLinks?.thumbnail??'',
                ratio: 2.6,
                raduis: 7,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          child:Text(
                            '${bookModel.volumeInfo.title}',
                            style: TextStyles.textStyle20,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          width: MediaQuery.of(context).size.width * .5),
                      const SizedBox(
                        height: 7,
                      ),
                       Text(
                        bookModel.volumeInfo.authors![0],
                        style: TextStyles.textStyle16,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                          child: Row(
                        children:  [
                       const   Text(
                            'Free ',
                            style: TextStyles.textStyle20,
                          ),
                         const Spacer(),
                          BookRating(bookModel:bookModel,)
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
