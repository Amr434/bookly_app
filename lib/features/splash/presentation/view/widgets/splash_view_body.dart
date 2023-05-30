import 'package:bookly_app/features/home/presentaion/views/home.dart';
import 'package:bookly_app/features/splash/presentation/view/widgets/singleanimated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashViewBody extends StatefulWidget {
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> slidinAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSliding();
    navigateToHome();
  }

  initSliding() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidinAnimation = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(const HomePage());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/images/Logo.png')),
        const SizedBox(
          height: 10,
        ),
        SlidingAnimated(
          slidinAnimation: slidinAnimation,
        )
      ],
    );
  }
}
