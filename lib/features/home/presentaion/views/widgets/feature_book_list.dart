import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/presentaion/manger/feature_cubit/feature_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manger/feature_cubit/feature_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/shimmer.dart';
import '../book_detail_view.dart';
import 'feature_list_view_item.dart';




class FeatureBookList extends StatelessWidget {
 const FeatureBookList({Key?key}):super(key: key);




  @override
  Widget build(BuildContext context) {


    return BlocBuilder<FeatureCubit, FeatureStates>(builder: (context, state)
    {

       if(state is FeatureSucessState){
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:state.bookModel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const  EdgeInsets.only(right: 30.0),
                  child: GestureDetector(
                    onTap: (){

                      Get.to( BookDetailView(bookModel: state.bookModel[index],));
                    },
                    child: FeatureListViewItem(
                      image: state.bookModel[index].volumeInfo.imageLinks!.thumbnail.toString(),
                      raduis: 15,
                      ratio: 2.7,
                    ),
                  ),
                );
              }),
        );
      }
       else if  (state is FeatureErrorState){
         return Text(state.error);
       }
       else {

         return  Container(
           height: 200,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
               itemBuilder: (context, index){
                 return const  ShimmerWidget(height: 200,width: 200,);
               },
               itemCount: 4
           ),
         );
      }

    });
  }
}






