import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../View/QuestionModels.dart';

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);



const apiKey = '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';

class ChatPage extends StatefulWidget {
  String? text;
  ChatPage({this.text});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int maxFailedLoadAttempts = 3;
  // InterstitialAd? _interstitialAd;
  // int _numInterstitialLoadAttempts = 0;
  // static final AdRequest request = AdRequest(
  //   keywords: <String>['foo', 'bar'],
  //   contentUrl: 'http://foo.com/bar.html',
  //   nonPersonalizedAds: true,
  // );
  //
  // void createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? "ca-app-pub-3940256099942544/1033173712"
  //           : "ca-app-pub-4273667104412938/5830752464",
  //       request: request,
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           print('$ad loaded');
  //           _interstitialAd = ad;
  //           _numInterstitialLoadAttempts = 0;
  //           _interstitialAd!.setImmersiveMode(true);
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error.');
  //           _numInterstitialLoadAttempts += 1;
  //           _interstitialAd = null;
  //           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
  //             createInterstitialAd();
  //           }
  //         },
  //       ));
  // }
  //
  // void _showInterstitialAd() {
  //   if (_interstitialAd == null) {
  //     print('Warning: attempt to show interstitial before loaded.');
  //     return;
  //   }
  //   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (InterstitialAd ad) =>
  //         print('ad onAdShowedFullScreenContent.'),
  //     onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //       print('$ad onAdDismissedFullScreenContent.');
  //       ad.dispose();
  //       createInterstitialAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //       print('$ad onAdFailedToShowFullScreenContent: $error');
  //       ad.dispose();
  //       createInterstitialAd();
  //     },
  //   );
  //   _interstitialAd!.show();
  //   // _interstitialAd = null;
  // }
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  bool firstchat = false;
  bool selectedcolor = false;
  String? answer;
  final chatGpt = ChatGpt(apiKey: apiKey);
  bool loading = false;
  final testPrompt =
      'Which Disney character famously leaves a glass slipper behind at a royal ball?';

  final List questionAnswers = [];

  late TextEditingController textEditingController;

  StreamSubscription<CompletionResponse>? streamSubscription;
  int shar = 0;
  int cop = 0;
  bool isspeak = false;
  @override
  void initState() {
    shar;
    cop;
    textEditingController = TextEditingController();
    super.initState();
    _initSpeech();

    // createInterstitialAd();
    // _showInterstitialAd();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  void storedata(String answer1) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("answer", answer1);
    // print(answer1);
  }

  FlutterTts flutterTts = FlutterTts();
  String? data;

  Future _speak(String ans) async {
    await flutterTts.speak(ans);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    streamSubscription?.cancel();
    super.dispose();
    flutterTts.stop();
  }

  QuestionAnswer? questionAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xff99C // appBar: AppBar(
      //     //     backgroundColor: Color(0xff00A4A3),
      //     //     centerTitle: true,
      //     //     title: Text(
      //     //       "Communicate with me",
      //     //       style:
      //     //           GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w200),
      //     //     )),FCE),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 0),
          child: Column(
            children: [
              Text(
                "I'm solobot and here I'm help you",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              firstchat == false
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 14,
                          right: 14,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20,
                                  ),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff00255A),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Hi there!  can i help you today. with ${widget.text}?",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: questionAnswers.length,
                        itemBuilder: (context, index) {
                          final questionAnswer = questionAnswers[index];
                          final answer =
                              questionAnswer.answer.toString().trim();
                          // _speak(answer);
                          storedata(answer);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Container(
                                    padding: EdgeInsets.only(
                                      // left: 14,
                                      right: 14,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                20,
                                              ),
                                              bottomRight: Radius.circular(20)),
                                          color: Color(0xff00255A),
                                        ),
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          'Q: ${questionAnswer.question}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0xff00255A),
                                    radius: 20,
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xff00A4A3),
                                    ),
                                  ),
                                  SizedBox(width:10,),
                                ],
                              ),
                              const SizedBox(height: 12),
                              if (answer.isEmpty && loading)
                                Container(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          child: Image.asset(
                                              "assets/images/bot.png"),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  30,
                                                ),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            color: Color(0xff9570FF30),
                                          ),
                                          // padding: EdgeInsets.all(16),
                                          child: JumpingDots(
                                            animationDuration:
                                                Duration(microseconds: 300000),
                                            color: Color(0xff00255A),
                                            radius: 10,
                                            numberOfDots: 3,
                                          ),
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                InkWell(
                                  onLongPress: () async {
                                    var value =
                                        await showTopModalSheet<String?>(
                                            context,
                                            DumyModal(
                                              share: answer,
                                              speaker: answer,
                                              copy: answer,
                                              ispeak: isspeak,
                                            ));
                                  },
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            child: Image.asset(
                                                "assets/images/bot.png"),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    30,
                                                  ),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: selectedcolor == false
                                                  ? Color(0xffD9D9D9)
                                                  : Color(0xff00255A),
                                            ),
                                            padding: EdgeInsets.all(16),
                                            child: Text(
                                              'A: $answer',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 15),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  highlightColor: Color(0xff0e3f83),
                                  focusColor: Color(0xff00255A),
                                  splashColor: Color(0xff00255A),
                                  onFocusChange: (value) {
                                    setState(() {
                                      selectedcolor = true;
                                    });
                                    print("selectedcolor$selectedcolor");
                                  },
                                  onHighlightChanged: (value) {},
                                ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                      ),
                    ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff00255A),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                // margin: const EdgeInsets.only(bottom: 10, left: 10, right: 4),
                child: Center(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0.0, 0.50),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: ConstrainedBox(
                                      constraints:
                                          const BoxConstraints(maxHeight: 50),
                                      child: Scrollbar(
                                        child: Center(
                                          child: TextField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            controller: textEditingController,
                                            onChanged: (value) {
                                              setState(() {
                                                value =
                                                    _speechToText.toString();
                                              });
                                            },
                                            maxLines: null,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    // _lastWords.isEmpty
                                                    //     ?
                                                    "Confirm",
                                                // : _lastWords,
                                                hintStyle: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white54,
                                                    fontSize: 16)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // AvatarGlow(
                                  //   showTwoGlows: true,
                                  //   startDelay: Duration(microseconds: 10),
                                  //   shape: BoxShape.circle,
                                  //   animate: _speechToText.isListening,
                                  //   glowColor: Colors.red,
                                  //   endRadius: 24,
                                  //   duration: Duration(milliseconds: 10),
                                  //   curve: Curves.linear,
                                  //   repeatPauseDuration:
                                  //       Duration(milliseconds: 10),
                                  //   repeat: true,
                                  //   child: InkWell(
                                  //     child: Icon(_speechToText.isNotListening
                                  //         ? Icons.mic
                                  //         : Icons.mic_none),
                                  //     onTap: _speechToText.isNotListening
                                  //         ? _startListening
                                  //         : _stopListening,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();

                          _sendMessage();
                          setState(() {
                            cop++;
                            firstchat = true;
                          });
                          if (cop % 5 == 0) {
                            // _showInterstitialAd();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // color: textEditingController.text.isEmpty
                              //     ? Colors.green.withOpacity(.4)
                              //     : Colors.green,
                              borderRadius: BorderRadius.circular(40)),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _sendMessage() async {
    final question = textEditingController.text.isEmpty
        ? _lastWords.toString()
        : textEditingController.text;
    // textEditingController.text;
    setState(() {
      textEditingController.clear();
      loading = true;
      questionAnswers.add(
        QuestionAnswer(
          question: question,
          answer: StringBuffer(),
        ),
      );
    });
    final testRequest = CompletionRequest(
      prompt: [question],
      stream: false,
      maxTokens:60,
      temperature:0.8,
        n:2,
      // topP:1.0
    );
    await _streamResponse(testRequest);
    setState(() => loading = false);
  }

  _streamResponse(CompletionRequest request) async {
    streamSubscription?.cancel();
    try {
      final stream = await chatGpt.createCompletionStream(request);
      streamSubscription = stream?.listen(
        (event) => setState(
          () {
            if (event.streamMessageEnd) {
              streamSubscription?.cancel();
            } else {
              return questionAnswers.last.answer.write(
                // HSLColor.fromColor(C),
                event.choices?.first.text,
              );
            }
          },
        ),
      );
    } catch (error) {
      setState(() {
        loading = false;
        questionAnswers.last.answer.write(
          "oh no,some thing went wrong ,please try again.!",
        );
      });
      print("Error occurred: $error");
    }
  }
}

class DumyModal extends StatelessWidget {
  String copy;
  String share;
  String speaker;
  bool ispeak;
  DumyModal(
      {required this.share,
      required this.speaker,
      required this.copy,
      required this.ispeak});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  // setState(() {
                  //   cop++;
                  // });
                  //
                  // _showInterstitialAd();
                  Clipboard.setData(ClipboardData(text: copy));
                  // AmeToast.sucesstoast("Text is copied");
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/copy.png",
                  height: 40,
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  //   setState(() {
                  //     shar++;
                  //   });
                  //   if (shar % 3 == 0) {
                  //     _showInterstitialAd();
                  //   }
                  //   print(shar);
                  //
                  // Share.text(share, share, 'text/plain');
                  Navigator.pop(context);

                  // Share.share(answer);
                },
                child: Image.asset(
                  "assets/images/share.png",
                  height: 30,
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => voicechanger(
                  //               speach: speaker,
                  //             )));
                },
                child: ispeak == false
                    ? Image.asset(
                        "assets/images/slectedspeaker.png",
                        height: 40,
                      )
                    : Icon(Icons.sailing)),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
