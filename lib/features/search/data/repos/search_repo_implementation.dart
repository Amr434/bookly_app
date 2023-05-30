
import 'package:bookly_app/core/errors/services_failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/serach_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../services/data_services.dart';

class SearchRepoImplement extends SearchRepository{
  ApiServices apiServices;
  SearchRepoImplement(this.apiServices);
  List<BookModel>searchList=[];

  @override
  Future<Either<Failure, List<BookModel>>>fetchSearchdata({required String searchText})  async{

    searchList=[];
   try{

   Map<String,dynamic> data=await apiServices.get(endPoint: 'volumes?q=$searchText');

     (data['items'] as List<dynamic>).forEach((element) {
      searchList.add(BookModel.fromJson(element));
     });
   return right( searchList);
   }
   catch(e) {
    if(e is DioError)
      {
        return left(ServicesFailure.fromDioErro(e));
      }
    return left(ServicesFailure(e.toString()));
       }
  }

}