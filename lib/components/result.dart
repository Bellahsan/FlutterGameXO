import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultPopup extends StatelessWidget {
  final String result;
  final VoidCallback onRetry;

  ResultPopup({required this.result, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(192, 67, 41, 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/clap.json',
            fit: BoxFit.cover,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.03),
          Text(
            result,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.065,
              fontFamily: 'Maven',
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.08),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white70),
              ),
              onPressed: onRetry,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Text(
                  "Rejouer ?",
                  style: TextStyle(
                      color: Color(0xFF432918),
                      fontSize: MediaQuery.of(context).size.width * 0.075,
                      fontFamily: 'Maven',
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
