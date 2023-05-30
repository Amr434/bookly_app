import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/presention/views/widgets/search_image.dart';
import 'package:bookly_app/features/search/presention/views/widgets/search_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentaion/views/widgets/book_rating.dart';
import '../../manger/searchcubit/search_cubit.dart';
import '../../manger/searchcubit/search_states.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<SearchCubit,SearchState>(
        builder: (context, state) {

          if(state is SearchSuccessState){
          print("length${state.bookModel.length}");
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: const  EdgeInsets.only(bottom: 20),
                    width: 120,
                    child: SearchItem(bookModel: state.bookModel[index],)
                );
              },
              itemCount: state.bookModel.length,
            );
          }
          else if(state is SearchErrorState){
            return const Text('error');
          }
          else{
            return const Center(child: CircularProgressIndicator(),);

          }
        }
    );
  }

}






