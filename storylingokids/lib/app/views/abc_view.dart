/*
 * Project Name:  StoryLingoKids
 * File Name:     abc_view.dart
 * File Function: ABC 故事页面
 * Author:        林继申、王麒懿
 * Update Date:   2024-06-15
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedSwitcher,
        AnimatedWidget,
        Animation,
        AnimationStatus,
        AxisDirection,
        BoxFit,
        BuildContext,
        Center,
        Colors,
        Container,
        EdgeInsets,
        FractionalTranslation,
        GestureDetector,
        Icon,
        IconButton,
        Icons,
        Image,
        Navigator,
        Offset,
        Positioned,
        Scaffold,
        Stack,
        State,
        StatefulWidget,
        Tween,
        ValueKey,
        Widget,
        debugPrint;
import 'package:flutter/services.dart'
    show DeviceOrientation, HapticFeedback, Offset, SystemChrome;
import 'package:just_audio/just_audio.dart' show AudioPlayer, LoopMode;

class PageABC extends StatefulWidget {
  const PageABC({super.key});

  @override
  _PageABCState createState() => _PageABCState();
}

class _PageABCState extends State<PageABC> {
  final _audioPlayer = AudioPlayer();
  final _backgroundMusicPlayer = AudioPlayer();
  final _imageUrls = [
    'assets/images/stories/abc/Start.png',
    'assets/images/stories/abc/Page_1.png',
    'assets/images/stories/abc/Page_2.png',
    'assets/images/stories/abc/Page_3.png',
    'assets/images/stories/abc/Page_4.png',
    'assets/images/stories/abc/Page_5.png',
    'assets/images/stories/abc/Page_6.png',
    'assets/images/stories/abc/End.png',
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
    _setLandscape();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _backgroundMusicPlayer.dispose();
    _setPortrait();
    super.dispose();
  }

  void _setLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _setPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _playBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer
          .setAsset('assets/audios/stories/Background.mp3');
      _backgroundMusicPlayer.setLoopMode(LoopMode.one);
      _backgroundMusicPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
  }

  void _playAudio(String audioPath) async {
    try {
      await _audioPlayer.setAsset(audioPath);
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
  }

  void _onImageTap() {
    HapticFeedback.lightImpact();
    if (_currentIndex == 0) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
    } else if (_currentIndex >= 7) {
      Navigator.pop(context);
    } else if (_audioPlayer.playing) {
      _audioPlayer.stop();
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
    } else {
      final audioPath = 'assets/audios/stories/abc/Audio_$_currentIndex.mp3';
      _playAudio(audioPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransitionX(
                  direction: AxisDirection.left,
                  position: animation,
                  child: child,
                );
              },
              child: Image.asset(
                _imageUrls[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.contain,
              ),
            ),
          ),
          GestureDetector(
            onTap: _onImageTap,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    super.key,
    required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
    }
  }

  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  late final Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<double>;
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
