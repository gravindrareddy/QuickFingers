import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Quick Fingers")),
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  //Static variables to hold colors permanently
  static var containerOneOriginalColor = Colors.red;
  static var containerTwoOriginalColor = Colors.green;
  static var containerThreeOriginalColor = Colors.blue;
  static var containerFourOriginalColor = Colors.black;
  static var containerFiveOriginalColor = Colors.orange;
  static var containerSixOriginalColor = Colors.purple;
  static var containerSevenOriginalColor = Colors.brown;
  static var colorsList = [
    Colors.yellow,
    Colors.grey,
    Colors.lightGreenAccent,
    Colors.teal,
    Colors.lime,
    Colors.black26,
    Colors.cyan
  ];

  var baseColorToMatchAndPlay;
  int pointsScored = 0;

  var containerOneColor = containerOneOriginalColor;
  var containerTwoColor = containerTwoOriginalColor;
  var containerThreeColor = containerThreeOriginalColor;
  var containerFourColor = containerFourOriginalColor;
  var containerFiveColor = containerFiveOriginalColor;
  var containerSixColor = containerSixOriginalColor;
  var containerSevenColor = containerSevenOriginalColor;

  int totalTimeToPlayGame = 10;

  //Timer timer;

  String timerCountDown = "timer";
  Icon playOrResetIcon;

//  static int randomNumb() {
//    final ary = new Random().nextInt(7);
//    return ary;
//  }

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
          resetCounter();
          
          Fluttertoast.showToast(
              msg: "Your score: $pointsScored",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    });
  }

  void initState() {
    super.initState();
    baseColorToMatchAndPlay = colorsList[Random().nextInt(7)];
    playOrResetIcon = Icon(Icons.play_arrow);
  }

  void userPointsCounter(MaterialColor colorPickedByUser) {
    if (colorPickedByUser == baseColorToMatchAndPlay) {
      pointsScored++;
      // todo: lock the container from further user clicks
    }
  }

  void resetCounter() {
    totalTimeToPlayGame = 10; // Reset timer to max
    pointsScored = 0; // Reset points to 0
    playOrResetIcon = Icon(Icons.play_arrow); // Replace Reset button with Play
    timerCountDown = "timer";
  }
}
