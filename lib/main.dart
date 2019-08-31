import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Quick Fingers")),
      body: QuickFingersGameWidget(),
    ),
  ));
}




/**
 * The primary Widget of the app that holds the game
 */
class QuickFingersGameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuickFingersGameWidgetState();
  }
}

/**
 * This is the Widget State which will define the dynamic nature of the Stateful Widget
 */
class _QuickFingersGameWidgetState extends State<QuickFingersGameWidget> {
  // Static variables to hold colors permanently
  static var containerOneOriginalColor = Colors.red;
  static var containerTwoOriginalColor = Colors.green;
  static var containerThreeOriginalColor = Colors.blue;
  static var containerFourOriginalColor = Colors.black;
  static var containerFiveOriginalColor = Colors.orange;
  static var containerSixOriginalColor = Colors.purple;
  static var containerSevenOriginalColor = Colors.brown;

  // Array that holds multiple colors
  static var colorsList = [
    Colors.yellow,
    Colors.grey,
    Colors.lightGreenAccent,
    Colors.teal,
    Colors.lime,
    Colors.black26,
    Colors.cyan
  ];

  // This holds the random color picked by system and it is the base color to be matched while playing the game
  var baseColorToMatchAndPlay;

  int pointsScored = 0;

  // These variables holds the current color filled in the containers. On the user tap, as color changes, the content of these variables also changes
  var containerOneColor = containerOneOriginalColor;
  var containerTwoColor = containerTwoOriginalColor;
  var containerThreeColor = containerThreeOriginalColor;
  var containerFourColor = containerFourOriginalColor;
  var containerFiveColor = containerFiveOriginalColor;
  var containerSixColor = containerSixOriginalColor;
  var containerSevenColor = containerSevenOriginalColor;

  // Configurable variable that holds the total time to play the game
  int totalTimeToPlayGame = 10;

  // placeholder string (ideally, it should be in the resource file)
  String timerCountDown = "timer";

  Icon playOrResetIcon;

  /**
   * Mandatory method of Widget State which holds the whole widget dynamic behavior. Note that this method returns a Widget
   */
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("$timerCountDown"),
            IconButton(
                icon: playOrResetIcon,
                tooltip: 'Start Game',
                onPressed: updateTimer),
            Container(
              height: 15.0,
              width: 15.0,
              color: baseColorToMatchAndPlay,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerOneColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerOneColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerOneColor = containerOneOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerOneColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerTwoColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerTwoColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerTwoColor = containerTwoOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerTwoColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerThreeColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerThreeColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerThreeColor = containerThreeOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerThreeColor,
              ),
            ))
          ],
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              containerFourColor = colorsList[Random().nextInt(7)];
            });
            userPointsCounter(containerFourColor);
          },
          onDoubleTap: () {
            setState(() {
              containerFourColor = containerFourOriginalColor;
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: containerFourColor,
          ),
        )),
        Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerFiveColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerFiveColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerFiveColor = containerFiveOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerFiveColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerSixColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerSixColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerSixColor = containerSixOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerSixColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerSevenColor = colorsList[Random().nextInt(7)];
                });
                userPointsCounter(containerSevenColor);
              },
              onDoubleTap: () {
                setState(() {
                  containerSevenColor = containerSevenOriginalColor;
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: containerSevenColor,
              ),
            ))
          ],
        ),
      ],
    ));
  }

  updateTimerDisplay(int time) {
    timerCountDown = time.toString();
  }

  updateTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (playOrResetIcon.key == Icon(Icons.play_arrow).key) {
        playOrResetIcon = Icon(Icons.pause); // Replace Reset button with Play
      } else if (playOrResetIcon.key == Icon(Icons.pause).key) {
        // cross check whether

      }

//      if (playOrResetIcon.key == Icon(Icons.pause).key) {
//
//      }

      //playOrResetIcon = Icon(Icons.pause);

      setState(() {
        updateTimerDisplay(totalTimeToPlayGame);
        totalTimeToPlayGame = totalTimeToPlayGame - 1;
        if (totalTimeToPlayGame < 0) {
          timer.cancel();
          Fluttertoast.showToast(
              msg: "Your score: $pointsScored",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          resetCounter();
        }
      });
    });
  }

  /**
   * This function is part of the lifecycle and executes only once
   */
  void initState() {
    super.initState();
    baseColorToMatchAndPlay = colorsList[Random().nextInt(7)];
    playOrResetIcon = Icon(Icons.play_arrow);
  }

  /**
   * As the color matches, counter will update the user score
   */
  void userPointsCounter(MaterialColor colorPickedByUser) {
    print("Inside userPointsCounter:1");
    if (colorPickedByUser == baseColorToMatchAndPlay) {
      pointsScored++;
      print("Inside userPointsCounter:2");
      // todo: lock the container from further user clicks
    }
  }

  /**
   * As the game ends, this method will be triggered to reset all the required variables
   */
  void resetCounter() {
    totalTimeToPlayGame = 10; // Reset timer to max
    pointsScored = 0; // Reset points to 0
    playOrResetIcon = Icon(Icons.play_arrow); // Replace Reset button with Play
    timerCountDown = "timer";
  }
}
