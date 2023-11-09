import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkInProgress extends StatelessWidget {
  const WorkInProgress({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/app_logo.png",
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10,),
          Wrap(
            spacing: 5,
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "Work In Progress",
              ),
              SpinKitThreeBounce(
                color: Colors.blue,
                size: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
