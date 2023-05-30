import 'package:bookly_app/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/feature_book_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'newest_saller_listView.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          children:  [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: FeatureBookList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Newest Seller', style: TextStyles.textStyle18),
                ),
              ],
            ),

           const NewestSellerListView(),
          ]
        ),
      )
    );
  }
}




