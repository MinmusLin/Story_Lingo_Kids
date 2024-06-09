/*
 * Project Name:  StoryLingoKids
 * File Name:     numbers_view.dart
 * File Function: 数字页面
 * Author:        林继申
 * Update Date:   2024-06-09
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
        MaterialPageRoute,
        Navigator,
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
import 'package:storylingokids/app/views/numbers_test_view.dart'
    show NumbersTestView;
import 'package:storylingokids/app/widgets/view_header.dart' show ViewHeader;
import 'package:storylingokids/app/widgets/text_card.dart' show TextCard;

class NumbersView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const NumbersView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<NumbersView> createState() => _NumbersViewState();
}

class _NumbersViewState extends State<NumbersView> {
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
            child: ViewHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
              onTest: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NumbersTestView(
                            title: '${widget.title} Test',
                            primaryColor: widget.primaryColor,
                            secondaryColor: widget.secondaryColor,
                          )),
                );
              },
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
                    title: numbersList[index].number,
                    textColor: Colors.primaries[index % Colors.primaries.length]
                        .withOpacity(0.8),
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
