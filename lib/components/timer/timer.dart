import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @required final int time;

  TimerWidget({
    Key key,
    this.time,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer _timer;

  int _start = 0;
  bool isCooking = false;

  @override
  initState() {
    super.initState();
    _start = widget.time;
  }

  void startTimer() {
    setState(() {
      isCooking = true;
    });

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          setState(() {
            isCooking = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void stopTimer() {
    setState(() {
      isCooking = false;
      _start = widget.time;
    });

    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getPreparedTimer(time) {
    return (_start % 60).toString().padLeft(2, '0');
  }

  String _printDuration(int time) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(Duration(seconds: time).inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(Duration(seconds: time).inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              _printDuration(_start),
              style: TextStyle(fontSize: 48, color: Color(0xFFFFFFFF)),
            ),
            padding: EdgeInsets.only(bottom: 24),
          ),
          GestureDetector(
            onTap: () {
              isCooking ? stopTimer() : startTimer();
            },
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFF3B2F),
              ),
              child: Row(children: [
                Spacer(),
                Text(
                  isCooking ? "Clear" : "Start",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
