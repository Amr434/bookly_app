import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentaion/manger/similar_book_cubit/fetch_similar_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_book_sec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_detail_sec.dart';

class BookDetailViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailViewBody({Key? key,required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context)=>SimilarCubit(getit.get<HomeRepoImplement>())..fetchSimilarBook(categorie: bookModel.volumeInfo.categories![0]) ,
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              children:  [
                BookDetailSec(
                  bookModel: bookModel,
                ),
               const SizedBox(
                  height: 40,
                ),
               const SimilarBookSec()
              ],
            )),
      ),
    );
  }
}
