import 'package:bookly_app/features/search/presention/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/services_locator.dart';
import '../../data/repos/search_repo_implementation.dart';
import '../manger/searchcubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(create: (context) {
        return SearchCubit(
            getit.get<SearchRepoImplement>()
        );
      },
      child:const SafeArea(
          child: SearchBody(),
    )
      ),

    );
  }
}
