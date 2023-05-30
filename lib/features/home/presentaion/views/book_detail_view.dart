import 'dart:async';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_detail_view_body.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailView extends StatefulWidget {
  final BookModel bookModel;
  const BookDetailView({Key? key,required this.bookModel}) : super(key: key);

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
   late bool isConnected;
  late   ConnectivityResult result;
late StreamSubscription streamSubscribtion;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startstreaming();
  }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void checkInternet()  async{
    result =await Connectivity().checkConnectivity();
    if(result!=ConnectivityResult.none){
      isConnected=true;
    }
    else{
      isConnected=false;
      showDiologeBox();
    }
    setState(() {
    });
  }

  showDiologeBox(){
   return  showDialog(context: context, builder: (context)=>  CupertinoAlertDialog(
     title: const Text('No Internet'),
     actions: [
       CupertinoButton(child: const Text('Retry'), onPressed: () async{
         Navigator.pop(context);
          checkInternet();
       })
     ],
   ));
  }

  startstreaming() async{
    streamSubscribtion=Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
    return streamSubscribtion;
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      builder: (context,snapshot){
        return Scaffold(
          body: snapshot.data!=ConnectivityResult.none? SafeArea(child: BookDetailViewBody(bookModel:  this.widget.bookModel,)):
         Center(child: Image.asset('assets/images/internet.jpg',fit: BoxFit.fill,),)
        );
      },
      stream:Connectivity().onConnectivityChanged ,
    );
  }


}
