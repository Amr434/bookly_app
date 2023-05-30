import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class SearchState{}

class InitialSearchState extends SearchState{}

class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
  List<BookModel> bookModel;
  SearchSuccessState(this.bookModel);

}
class SearchErrorState extends SearchState{
  final String error;
  SearchErrorState(this.error);
}

