import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentaion/manger/feature_cubit/feature_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manger/feature_cubit/feature_states.dart';
import 'package:bookly_app/features/home/presentaion/manger/newest_cubit/newest_cubit.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presention/manger/searchcubit/search_cubit.dart';
import 'package:bookly_app/features/splash/presentation/view/splashview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  setupServices();

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeatureCubit(
            getit.get<HomeRepoImplement>()..fetchFeatureBooks(),
          )..fetchFeatureBooks();
        }),
        BlocProvider(create: (context) {
          return FeatureNewestCubit(
            getit.get<HomeRepoImplement>(),
          )..fetchFeatureNewestBooks();
        }),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColorDark: const Color(0xff100B20),
          scaffoldBackgroundColor: const Color(0xff100B20),
          primaryColor: const Color(0xff100B20),
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontFamily: 'GT Sectra Fine')),
        ),
        home: SplashView(),
      ),
    );
  }
}
