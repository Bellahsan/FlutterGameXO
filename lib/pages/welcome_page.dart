import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xo/components/copyrights.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Column(
            children: [
              Lottie.asset('assets/loading.json',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width),
              Text(
                'XO',
                style: TextStyle(
                    fontFamily: 'Maven',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // copyrights
        CopyrightWidget(
          fontSize: MediaQuery.of(context).size.width * 0.025,
        ),
      ],
    );
  }
}
