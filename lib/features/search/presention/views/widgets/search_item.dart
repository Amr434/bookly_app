import 'package:bookly_app/features/home/presentaion/views/book_detail_view.dart';
import 'package:bookly_app/features/search/presention/views/widgets/search_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentaion/views/widgets/book_rating.dart';

class SearchItem extends StatelessWidget {
  final BookModel bookModel;
  const SearchItem({Key? key,required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(BookDetailView(bookModel: bookModel));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
             SearchImage(image: bookModel.volumeInfo.imageLinks?.thumbnail??''),
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
                      bookModel.volumeInfo.authors?[0]??'',
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
        ),
      ),
    );
  }
}
