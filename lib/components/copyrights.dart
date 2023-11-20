import 'package:flutter/material.dart';

class CopyrightWidget extends StatelessWidget {
  final double fontSize;
  const CopyrightWidget({super.key, required this.fontSize});

  String getCurrentYear() {
    return DateTime.now().year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Text(
        '© ${getCurrentYear()} Belhassen Chaouachi. Tous droits réservés.',
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Maven',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
