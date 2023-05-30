import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/data/services/app_services.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/search/data/services/data_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupServices() {
  getit.registerSingleton<AppServices>(AppServices(Dio()));


  getit.registerSingleton<ApiServices>(ApiServices(Dio()));

  getit.registerSingleton<HomeRepoImplement>(
      HomeRepoImplement(getit.get<AppServices>()));
  getit.registerSingleton<SearchRepoImplement>(
      SearchRepoImplement(getit.get<ApiServices>())
  );
}



