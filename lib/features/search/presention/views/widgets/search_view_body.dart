import 'package:bookly_app/features/search/presention/manger/searchcubit/search_cubit.dart';
import 'package:bookly_app/features/search/presention/manger/searchcubit/search_states.dart';
import 'package:bookly_app/features/search/presention/views/widgets/search_result_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_form_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomTextFormField(
                      onchange: (String ?val){
                        if(val!.isNotEmpty){
                          BlocProvider.of<SearchCubit>(context).fetchSearchData(searchText: val);
                        }
                        BlocProvider.of<SearchCubit>(context).fetchSearchData(searchText: ' programing');

                      },
                    ),
                  ),
                 const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Search Result',
                      style: TextStyles.textStyle20,
                    ),
                  ),
                  const SearchResultList()
                ],
              ),
            )
          ],
        );
  }
}


