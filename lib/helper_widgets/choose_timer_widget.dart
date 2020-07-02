import 'package:flutter/material.dart';
import 'package:santulan/model/choose_time_arguments.dart';
import 'package:santulan/themes/styling_constants.dart';

const TIMER_CONTAINER_HEIGHT = 150.0;
const TIMER_CONTAINER_WIDTH = 200.0;
const TIMER_FONT_SIZE = 60.0;
const TIMER_HEADER_FONT_SIZE = 30.0;
const TIMER_CONTAINER_BORDER = 1.0;

class ChooseTimerWidget extends StatefulWidget {
  _ChooseTimerWidget createState() => _ChooseTimerWidget();
}

class _ChooseTimerWidget extends State<ChooseTimerWidget> {
  static const allowedTimes = [10, 30, 45, 60, 90];
  int selectedTime = 2; // Points to 45 seconds

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              PADDING_BETWEEN_WIDGET,
            ),
            child: Text(
              "Choose Time",
              style: TextStyle(
                fontSize: TIMER_HEADER_FONT_SIZE,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              PADDING_BETWEEN_WIDGET,
            ),
            child: chooseTimerScrollWidget(context),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: PADDING_BETWEEN_WIDGET,
            ),
            child: chooseTimerButtonWidget(context),
          ),
          Padding(
            padding: const EdgeInsets.all(
              PADDING_BETWEEN_WIDGET,
            ),
            child: Text(
              "Start Timer",
              style: TextStyle(
                fontSize: PARAGRAPH_FONT_SIZE,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseTimerScrollWidget(BuildContext context) {
    ScrollController _controller = ScrollController(
        initialScrollOffset: TIMER_CONTAINER_HEIGHT * selectedTime);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: TIMER_CONTAINER_BORDER,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: TIMER_CONTAINER_BORDER,
          ),
        ),
      ),
      height: TIMER_CONTAINER_HEIGHT,
      child: ListView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: allowedTimes
            .asMap()
            .entries
            .map((allowedTime) => Container(
                  width: TIMER_CONTAINER_WIDTH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: new RaisedButton(
                          highlightColor: null,
                          child: Text(
                            '${allowedTime.value}s',
                            style: TextStyle(
                              fontSize: TIMER_FONT_SIZE,
                              color: allowedTime.key == selectedTime
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          onPressed: () => {
                            setState(() {
                              selectedTime = allowedTime.key;
                              _controller.animateTo(
                                  TIMER_CONTAINER_HEIGHT * selectedTime,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            })
                          },
                          color: allowedTime.key == selectedTime
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget chooseTimerButtonWidget(BuildContext context) {
    return Center(
      child: Container(
        child: FloatingActionButton(
          heroTag: "Start Timer",
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: CIRCULAR_BUTTON_RADIUS,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/settings",
              arguments: ChooseTimeArguments(allowedTimes[selectedTime]),
            );
          },
        ),
      ),
    );
  }
}
