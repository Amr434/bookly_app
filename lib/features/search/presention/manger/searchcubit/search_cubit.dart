import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presention/manger/searchcubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchRepoImplement):super(InitialSearchState());

  SearchRepoImplement searchRepoImplement;
   fetchSearchData({required String searchText})async{

    emit(SearchLoadingState());
      var result= await searchRepoImplement.fetchSearchdata(searchText: searchText);
      result.fold(
              (failure){
                emit(SearchErrorState(failure.message)); },
              (books) {
                emit(SearchSuccessState(books));
              }
      );





  }

}