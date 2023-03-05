import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class voicechanger extends StatefulWidget {
  String? speach;
  voicechanger({required this.speach});
  @override
  _voicechangerState createState() => _voicechangerState();
}

enum TtsState {
  playing,
  stopped,
  paused,
}

class _voicechangerState extends State<voicechanger> {
  late FlutterTts flutterTts;

  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);

    if (widget.speach != null) {
      if (widget.speach!.isNotEmpty) {
        await flutterTts.speak(widget.speach!);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff99CFCE),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff00A4A3),
                    borderRadius:
                        BorderRadius.circular(10), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54, //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.speach.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                _btnSection(),
                _buildSliders(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btnSection() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              Colors.white, Colors.white, Icons.play_arrow, 'PLAY', _speak),
          _buildButtonColumn(
              Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
          _buildButtonColumn(
              Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause)
        ],
      ),
    );
  }

  _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Container(
      decoration:
          BoxDecoration(color: Color(0xff00255A), shape: BoxShape.circle),
      height: 150,
      child: IconButton(
          icon: Icon(icon),
          color: color,
          splashColor: splashColor,
          onPressed: () => func()),
    );
  }

  Widget _buildSliders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "set your recomended voice ",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          // margin: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffE9ACFF)),
          child: _pitch(),
        ),
        Text(
          "Set your voice understanding Speed",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffE9ACFF)),
          child: _rate(),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "ChatGpt..Open-Ai pro..",
            style: GoogleFonts.poppins(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w100),
          ),
        )
      ],
    );
  }

  Widget _pitch() {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 10.0,
          trackShape: RoundedRectSliderTrackShape(),
          // activeTrackColor: Colors.purple.shade800,
          // inactiveTrackColor: Colors.purple.shade100,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 14.0,
            pressedElevation: 8.0,
          ),
          // thumbColor: Colors.pinkAccent,
          overlayColor: Colors.pink.withOpacity(0.2),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          // activeTickMarkColor: Color(0xff00255A),
          // inactiveTickMarkColor: Colors.white,
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          // valueIndicatorColor: Colors.black,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        child: Slider(
          value: pitch,
          onChanged: (newPitch) {
            setState(() => pitch = newPitch);
          },
          min: 0.5,
          max: 2.0,
          divisions: 15,
          label: "Pitch: $pitch",
          activeColor: Color(0xff00255A),
          inactiveColor: Color(0xff00A4A3),
        ));
  }

  Widget _rate() {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 10.0,
          trackShape: RoundedRectSliderTrackShape(),
          // activeTrackColor: Colors.purple.shade800,
          // inactiveTrackColor: Colors.purple.shade100,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 14.0,
            pressedElevation: 8.0,
          ),
          // thumbColor: Colors.pinkAccent,
          overlayColor: Colors.pink.withOpacity(0.2),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          // activeTickMarkColor: Color(0xff00255A),
          // inactiveTickMarkColor: Colors.white,
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          // valueIndicatorColor: Colors.black,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        child: Slider(
          value: rate,
          onChanged: (newRate) {
            setState(() => rate = newRate);
          },
          min: 0.0,
          max: 1.0,
          divisions: 10,
          label: "Rate: $rate",
          activeColor: Colors.green,
        ));
  }
}
