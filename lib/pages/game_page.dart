import 'package:flutter/material.dart';
import 'package:xo/components/colors.dart';
import 'package:xo/components/copyrights.dart';
import 'package:xo/components/logic.dart';
import 'package:xo/components/result.dart';
import 'package:xo/components/tour.dart';

class GamePage extends StatefulWidget {
  GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //
  //  adding the necessary variables
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0; // to check the draw
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  //
  // the score are for the different combination of the game [Row1,2,3, Col1,2,3, Diagonal1,2];

  // game component
  Game game = Game();

  // init
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
  }

  // show popup
  void showResultPopup(String result) {
    showDialog(
      context: context,
      barrierDismissible: false, // block click outside popup
      builder: (BuildContext context) {
        return ResultPopup(
          result: result,
          onRetry: () {
            setState(() {
              game.board = Game.initGameBoard();
              lastValue = "X";
              gameOver = false;
              turn = 0;
              result = "";
              scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
          //
          TourWidget(value: lastValue),
          //
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: Game.boardLength ~/ 3,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
              children: List.generate(Game.boardLength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == "") {
                            setState(() {
                              game.board![index] = lastValue;
                              turn++;
                              gameOver = game.winnerCheck(
                                  lastValue, index, scoreboard, 3);

                              if (gameOver) {
                                result = "Bravo $lastValue !";
                                showResultPopup(result);
                              } else if (!gameOver && turn == 9) {
                                result = "Null";
                                gameOver = true;
                                showResultPopup(result);
                              }
                              if (lastValue == "X") {
                                lastValue = "O";
                              } else {
                                lastValue = "X";
                              }
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocSize,
                    height: Game.blocSize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        game.board?[index] ?? "",
                        style: TextStyle(
                          color: game.board?[index] == "X"
                              ? Color.fromARGB(255, 25, 152, 255)
                              : Color.fromARGB(255, 255, 15, 15),
                          fontSize: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
          // copyrights
          CopyrightWidget(
            fontSize: MediaQuery.of(context).size.width * 0.025,
          ),
        ],
      ),
    );
  }
}
