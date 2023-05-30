import 'package:bookly_app/core/utils/shimmer.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/manger/similar_book_cubit/fetch_similar_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manger/similar_book_cubit/fetch_similar_state.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/shimmer_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'feature_list_view_item.dart';

class SimilarBookSec extends StatelessWidget {

  const SimilarBookSec({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SimilarCubit,SimilarStates>(
      builder: (context, state) {

        if(state is SimilarStateSucess ){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You  Can Also Like',
                style: TextStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: FeatureListViewItem
                        (
                          image: state.booksModel[index].volumeInfo.imageLinks?.thumbnail??'', raduis: 12, ratio: 2.6),
                    );
                  },
                  itemCount: state.booksModel.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          );
        }
        else if(state is SimilarStateError)
        {
          return Text(state.errorMessage);
        }
        else
        {
          return  SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ShimmerWidget(width: 100, height: 100);
                }),
          );
        }
      },

    );
  }
}

