import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/shimmer.dart';

class   ShimmerListView extends StatelessWidget {
  const ShimmerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0,bottom: 20),
            child: Row(
              children:  [
                const ShimmerWidget(height: 120,width: 120,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    ShimmerWidget(width: 200, height: 30),
                    SizedBox(height: 10,),
                    ShimmerWidget(width: 100, height: 30),
                    SizedBox(height: 10,),
                    ShimmerWidget(width: 200, height: 30),
                  ],
                )

              ],),
          ) ;
        });
  }
}