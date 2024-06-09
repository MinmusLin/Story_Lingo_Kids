/*
 * Project Name:  StoryLingoKids
 * File Name:     colors_test_view.dart
 * File Function: 颜色测试页面
 * Author:        林继申
 * Update Date:   2024-06-10
 * License:       MIT License
 */

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart'
    show
        AlertDialog,
        BouncingScrollPhysics,
        BuildContext,
        Color,
        Colors,
        CustomScrollView,
        EdgeInsets,
        FontWeight,
        Navigator,
        Padding,
        RichText,
        Scaffold,
        ScrollController,
        SliverChildBuilderDelegate,
        SliverGrid,
        SliverGridDelegateWithFixedCrossAxisCount,
        SliverToBoxAdapter,
        State,
        StatefulWidget,
        Text,
        TextButton,
        TextSpan,
        TextStyle,
        Widget,
        showDialog;
import 'package:storylingokids/app/debug_mode.dart' show DebugMode;
import 'package:storylingokids/app/lists/colors_list.dart' show colorsList;
import 'package:storylingokids/app/widgets/test_view_header.dart'
    show TestViewHeader;
import 'package:storylingokids/app/widgets/test_color_card.dart'
    show TestColorCard;

class ColorsTestView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const ColorsTestView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<ColorsTestView> createState() => _ColorsTestViewState();
}

class _ColorsTestViewState extends State<ColorsTestView> {
  final _scrollController = ScrollController();
  double offset = 0;
  late stt.SpeechToText _speech;
  String _speechText = '';
  late String _currentTitle;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _speech.initialize();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    if (_speech.isListening) {
      _speech.stop();
    }
    _speech.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
  }

  void _startListening(String title) async {
    _currentTitle = title;
    _speechText = '';
    if (_speech.isListening) {
      await _speech.cancel();
    }
    _speech.listen(
      onResult: (result) {
        setState(() {
          _speechText = result.recognizedWords;
          if (kDebugMode) {
            print('Recognition results: $_speechText');
          }
        });
      },
      localeId: 'en_US',
    );
  }

  void _stopListening() {
    _speech.stop().then((_) {
      setState(() {
        _showDialog();
      });
    });
  }

  void _showDialog() {
    bool isCorrect = false;
    if (DebugMode.isDebugMode) {
      isCorrect = true;
      _speechText = _currentTitle.toLowerCase();
    } else {
      isCorrect = _speechText.isNotEmpty &&
          _speechText.toLowerCase() == _currentTitle.toLowerCase();
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isCorrect ? "🥳 Great Job!" : "😉 Try Again!",
          style: const TextStyle(
            fontFamily: 'CabinSketch',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
        ),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: _speechText.isEmpty
                    ? 'Louder, please!\n'
                    : 'Your speech: $_speechText\n',
                style: const TextStyle(
                  fontFamily: 'CabinSketch',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text:
                    isCorrect ? "That's perfect!" : "Let's try one more time!",
                style: TextStyle(
                  fontFamily: 'CabinSketch',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: 'CabinSketch',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TestViewHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: colorsList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TestColorCard(
                    title: colorsList[index].name,
                    textColor: colorsList[index].name == 'White'
                        ? const Color(0xFF303030)
                        : Colors.white,
                    backgroundColor: Color(int.parse(colorsList[index].code)),
                    onPressed: () => _startListening(colorsList[index].name),
                    onReleased: _stopListening,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
