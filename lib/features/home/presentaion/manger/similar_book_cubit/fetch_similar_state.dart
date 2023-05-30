import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class  SimilarStates{}
class SimilarIntialState extends SimilarStates{}

class SimilarStateLoading extends SimilarStates{}

class SimilarStateSucess extends SimilarStates{
  final List<BookModel> booksModel;
  SimilarStateSucess(this.booksModel);
}

class SimilarStateError extends SimilarStates
{
  final String errorMessage;
  SimilarStateError(this.errorMessage);


}