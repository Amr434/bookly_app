import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/manger/similar_book_cubit/fetch_similar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo_imp.dart';

class SimilarCubit extends Cubit<SimilarStates>
{
  SimilarCubit(this.homeRepo): super(SimilarIntialState());

List<BookModel>? bookmodel;


  SimilarCubit get(context) => BlocProvider.of(context);

  final HomeRepoImplement homeRepo;

  Future<void> fetchSimilarBook({required String categorie}) async {
    emit(SimilarStateLoading());
    var result = await homeRepo.fetchSimilarBooks(categorie: categorie);
    result.fold((failure) {
      emit(SimilarStateError(failure.message));
    }, (books) {
      bookmodel=books;
      emit(SimilarStateSucess(books));
    });
  }
}