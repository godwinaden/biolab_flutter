import 'package:biolab/components/switz_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingComponent extends StatelessWidget {
  final Size screenSize;
  final bool isShimmer;
  final bool isTransparent;
  final double? radius;

  const LoadingComponent({
    Key? key,
    required this.screenSize,
    this.radius,
    this.isShimmer = true,
    this.isTransparent = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: isTransparent? Colors.white.withOpacity(0.5) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius?? 0),
          topRight: Radius.circular(radius?? 0),
        ),
      ),
      child: isShimmer? const FittedBox(
        alignment: Alignment.topCenter,
        child: SwitzShimmer(
          type: 3,
        )
      )
          :
      Center(child: SpinKitFadingCircle(
        color: Colors.blue.withOpacity(0.5),
      )),
    );
  }
}
