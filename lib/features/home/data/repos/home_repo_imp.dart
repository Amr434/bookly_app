import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/data/services/app_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/services_failure.dart';

class HomeRepoImplement implements HomeRepo {
  AppServices appServices;
  HomeRepoImplement(this.appServices);
  List<BookModel> newestbookModel=[] ;

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      List<BookModel> bookModel;
      Map<String, dynamic> data = await appServices.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=Newest&q=computer science');

      data['items'].forEach((e){
        newestbookModel.add(BookModel.fromJson(e));
      });
      return right(newestbookModel);

    } catch (e)
    {
      if (e is DioError) {
        return left(ServicesFailure.fromDioErro(e));
      }

      return left(ServicesFailure(e.toString()));
    }
  }
  List<BookModel> bookModel=[] ;
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
    try {


      Map<String,dynamic> data = await appServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

      data['items'].forEach((e){
        bookModel.add(BookModel.fromJson(e));
      });
      return right(bookModel);
    } catch (e) {
      if (e is DioError)
      {
        return left(ServicesFailure.fromDioErro(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }


  List<BookModel> similarBookModel=[];
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String categorie}) async{
print("cat -------------------------------------"+categorie);
    try {
      Map<String,dynamic> data = await appServices.get(endPoint: 'volumes?Filtering=free-ebooks&sorting=relevance&q=subject:$categorie computer science');

      data['items'].forEach((e) {
        similarBookModel.add(BookModel.fromJson(e));
      });
      return right(similarBookModel);
    } catch (e) {
      if (e is DioError) {
        return left(ServicesFailure.fromDioErro(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }
}
