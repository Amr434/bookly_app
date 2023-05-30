import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentaion/manger/newest_cubit/newest_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/shimmer_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/newest_cubit/newest_state.dart';
import 'newest_saller_item.dart';

class NewestSellerListView extends StatelessWidget {
  const NewestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureNewestCubit,FeatureNewstStates>(
      builder: (context, state)
      {
       if(state is FeatureNewstSucessState){

         return   ListView.builder(
          physics:const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           padding: EdgeInsets.zero,
           itemCount: state.bookModel.length,
           itemBuilder: (context, index) {
             return  Padding(
               padding: const EdgeInsets.only(bottom: 50),
               child: NewestSallerItem(bookModel: state.bookModel[index]),
             );
           },
         );
       }
       else if(state is FeatureNewstErrorState){
         return Text(state.error,style: TextStyles.textStyle20,);
       }
       else
       {
      return  const ShimmerListView();
       }
      },

    );
  }
}




