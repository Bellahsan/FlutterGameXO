import 'package:flutter/material.dart';

class TourWidget extends StatelessWidget {
  final String value;
  const TourWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$value Joue",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontFamily: 'Maven',
          ),
        )
      ],
    );
  }
}
