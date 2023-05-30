import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository
{
  SearchRepository();
Future<Either<Failure,List<BookModel>>> fetchSearchdata({required String searchText});
}