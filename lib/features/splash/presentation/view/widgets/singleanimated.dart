import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidingAnimated extends StatelessWidget {
  final Animation<Offset> slidinAnimation;
  const SlidingAnimated({Key? key, required this.slidinAnimation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidinAnimation,
          child: const Center(
              child: Text(
            'Read Free Books ',
            style: TextStyle(fontSize: 20),
          )),
        );
      },
      animation: slidinAnimation,
    );
  }
}
