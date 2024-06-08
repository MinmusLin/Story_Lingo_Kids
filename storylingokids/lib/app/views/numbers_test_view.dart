/*
 * Project Name:  StoryLingoKids
 * File Name:     numbers_test_view.dart
 * File Function: 数字测试页面
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        BouncingScrollPhysics,
        BuildContext,
        Color,
        Colors,
        CustomScrollView,
        EdgeInsets,
        Padding,
        Scaffold,
        ScrollController,
        SliverChildBuilderDelegate,
        SliverGrid,
        SliverGridDelegateWithFixedCrossAxisCount,
        SliverToBoxAdapter,
        State,
        StatefulWidget,
        Widget,
        debugPrint;
import 'package:just_audio/just_audio.dart' show AudioPlayer;
import 'package:storylingokids/app/lists/numbers_list.dart' show numbersList;
import 'package:storylingokids/app/widgets/test_view_header.dart'
    show TestViewHeader;
import 'package:storylingokids/app/widgets/text_card.dart' show TextCard;

class NumbersTestView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const NumbersTestView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<NumbersTestView> createState() => _NumbersTestViewState();
}

class _NumbersTestViewState extends State<NumbersTestView> {
  final _scrollController = ScrollController();
  final _audioPlayer = AudioPlayer();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
  }

  void _playAudio(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath);
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
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
              childCount: numbersList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TextCard(
                    title: numbersList[index].text,
                    textColor: getIndexColor(index),
                    onTap: () => _playAudio(numbersList[index].audio),
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

Color getIndexColor(int index, {double opacity = 0.8}) {
  return Colors.primaries[index % Colors.primaries.length].withOpacity(opacity);
}