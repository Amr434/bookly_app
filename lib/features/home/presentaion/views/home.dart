import 'package:bookly_app/features/home/presentaion/views/widgets/homeBody.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return const Scaffold(
          body: SafeArea(
              child:HomeBody()
          ),
        );


  }
}
