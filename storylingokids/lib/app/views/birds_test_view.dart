/*
 * Project Name:  StoryLingoKids
 * File Name:     birds_test_view.dart
 * File Function: 鸟测试页面
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        BouncingScrollPhysics,
        BuildContext,
        Color,
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
import 'package:just_audio/just_audio.dart'
    show AudioPlayer, PlayerState, ProcessingState;
import 'package:storylingokids/app/lists/birds_list.dart' show birdsList;
import 'package:storylingokids/app/widgets/image_card.dart' show ImageCard;
import 'package:storylingokids/app/widgets/test_view_header.dart'
    show TestViewHeader;
import 'dart:async' show StreamSubscription;

class BirdsTestView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const BirdsTestView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<BirdsTestView> createState() => _BirdsTestViewState();
}

class _BirdsTestViewState extends State<BirdsTestView> {
  StreamSubscription<PlayerState>? _subscription;
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
    _subscription?.cancel();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
  }

  void _playAudio(String firstAssetPath, String secondAssetPath) async {
    try {
      await _audioPlayer.setAsset(firstAssetPath);
      await _audioPlayer.play();
      _subscription?.cancel();
      _subscription = _audioPlayer.playerStateStream.listen((state) async {
        if (state.processingState == ProcessingState.completed) {
          await _audioPlayer.setAsset(secondAssetPath);
          await _audioPlayer.play();
          await _audioPlayer.playerStateStream.firstWhere(
              (state) => state.processingState == ProcessingState.completed);
          await _audioPlayer.stop();
          _subscription?.cancel();
        }
      });
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
              childCount: birdsList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: ImageCard(
                    title: birdsList[index].name!,
                    image: birdsList[index].image!,
                    onTap: () => _playAudio(
                        birdsList[index].audio!, birdsList[index].voice!),
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
