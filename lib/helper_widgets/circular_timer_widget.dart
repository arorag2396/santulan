import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:santulan/controller/mobile_sensor_data_collector.dart';
import 'package:santulan/model/sensor_data_arguments.dart';
import 'package:santulan/themes/styling_constants.dart';

const CIRCULAR_TIMER_BUTTON_PADDING = 20.0;
const SHOW_RESULT_BUTTON_PADDING = 10.0;
const CIRCULAR_TIMER_FONT_SIZE = 60.0;
const CIRCULAR_TIMER_CONTROL_BUTTONS_SIDE_PADDING = 100.0;
const CIRCULAR_TIMER_PROGRESS_INDICATOR_DIMENSIONS = 200.0;
const CIRCULAR_TIMER_PROGRESS_INDICATOR_STROKE_WIDTH = 20.0;
enum STATE { INITIAL, RUNNING, STOPPED }

class CircularTimerWidget extends StatefulWidget {
  final int selectedTime;

  CircularTimerWidget(this.selectedTime);

  _CircularTimerWidget createState() => _CircularTimerWidget(selectedTime);
}

class _CircularTimerWidget extends State<CircularTimerWidget> {
  // TODO: Better names, and order
  final int selectedTime;
  double ratio = 1.0;
  int currentTime;
  Duration timeout;
  Timer timer;
  STATE state = STATE.INITIAL;
  bool timerCompleted = false;
  MobileSensorDataCollector mobileSensorDataCollector;

  _CircularTimerWidget(this.selectedTime) {
    timeout = Duration(seconds: selectedTime);
    currentTime = selectedTime;
    mobileSensorDataCollector = new MobileSensorDataCollector();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // TODO: Use map to make is compact
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              PADDING_BETWEEN_WIDGET,
            ),
            child: circularTimerWidget(context),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: PADDING_BETWEEN_WIDGET,
            ),
            child: circularTimerControlsWidget(context),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: PADDING_BETWEEN_WIDGET,
            ),
            child: showResultButtonWidget(context),
          ),
        ],
      ),
    );
  }

  Widget circularTimerWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: CIRCULAR_TIMER_PROGRESS_INDICATOR_DIMENSIONS,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: CIRCULAR_TIMER_PROGRESS_INDICATOR_DIMENSIONS,
                  height: CIRCULAR_TIMER_PROGRESS_INDICATOR_DIMENSIONS,
                  child: new CircularProgressIndicator(
                    strokeWidth: CIRCULAR_TIMER_PROGRESS_INDICATOR_STROKE_WIDTH,
                    value: ratio,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      state == STATE.INITIAL ? Colors.black : Colors.green,
                    ),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$currentTime",
                  style: TextStyle(
                    fontSize: CIRCULAR_TIMER_FONT_SIZE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circularTimerControlsWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            left: CIRCULAR_TIMER_CONTROL_BUTTONS_SIDE_PADDING,
            right: CIRCULAR_TIMER_CONTROL_BUTTONS_SIDE_PADDING),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "Start",
                backgroundColor:
                    state == STATE.INITIAL ? Colors.black : Colors.grey,
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: CIRCULAR_BUTTON_RADIUS,
                ),
                onPressed: state == STATE.INITIAL ? _playOnPressed : null,
              ),
              FloatingActionButton(
                heroTag: "Stop",
                backgroundColor:
                    state == STATE.RUNNING ? Colors.red : Colors.grey,
                child: const Icon(
                  Icons.stop,
                  color: Colors.white,
                  size: CIRCULAR_BUTTON_RADIUS,
                ),
                onPressed: state == STATE.RUNNING ? _stopOnPressed : null,
              ),
              FloatingActionButton(
                heroTag: "Restart",
                backgroundColor:
                    state == STATE.INITIAL ? Colors.grey : Colors.blue,
                child: const Icon(
                  Icons.restore,
                  color: Colors.white,
                  size: CIRCULAR_BUTTON_RADIUS,
                ),
                onPressed: state != STATE.INITIAL ? _restartOnPressed : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showResultButtonWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: SHOW_RESULT_BUTTON_PADDING),
        child: Container(
          child: FloatingActionButton.extended(
            heroTag: null,
            backgroundColor: timerCompleted ? Colors.black : Colors.grey,
            label: Text(
              'Show Result',
              style: TextStyle(
                fontSize: PARAGRAPH_FONT_SIZE,
              ),
            ),
            onPressed: timerCompleted
                ? () {
              print(mobileSensorDataCollector.getCollectedPoints());
                    Navigator.pushNamed(
                      context,
                      "/result",
                      arguments: SensorDataArguments(
                        mobileSensorDataCollector.getCollectedPoints(),
                      ),
                    );
                  }
                : null,
          ),
        ),
      ),
    );
  }

  void _playOnPressed() {
    if (timer != null) {
      return;
    }
    mobileSensorDataCollector.startCollection();
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timerCompleted = false;
        state = STATE.RUNNING;
        currentTime -= 1;
        ratio = currentTime / selectedTime;
        if (currentTime == 0) {
          _stop();
          timer.cancel();
        }
      });
    });
  }

  void _stopOnPressed() {
    timer.cancel();
    setState(() {
      _stop();
    });
  }

  void _stop() {
    timerCompleted = true;
    state = STATE.STOPPED;
    mobileSensorDataCollector.stopCollection();
  }

  void _restartOnPressed() {
    setState(() {
      currentTime = selectedTime;
      ratio = 1.0;
      timer.cancel();
      timer = null;
      state = STATE.INITIAL;
      timerCompleted = false;
      mobileSensorDataCollector = new MobileSensorDataCollector();
    });
  }
}
