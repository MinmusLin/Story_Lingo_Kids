import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class Pageabc extends StatefulWidget {
  final String title;

  const Pageabc({super.key, required this.title});

  @override
  _PageabcState createState() => _PageabcState();
}

class _PageabcState extends State<Pageabc> {
  final _audioPlayer = AudioPlayer();
  final _backgroundMusicPlayer = AudioPlayer();
  final _imageUrls = [
    'assets/images/stories/ABC/start.png',
    'assets/images/stories/ABC/page_1.png',
    'assets/images/stories/ABC/page_2.png',
    'assets/images/stories/ABC/page_3.png',
    'assets/images/stories/ABC/page_4.png',
    'assets/images/stories/ABC/page_5.png',
    'assets/images/stories/ABC/page_6.png',
    'assets/images/stories/ABC/end.png',
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
      await _backgroundMusicPlayer.setAsset('assets/audios/stories/background.mp3');
      _backgroundMusicPlayer.setLoopMode(LoopMode.one);
      _backgroundMusicPlayer.play();
    } catch (e) {
      debugPrint('Error loading background music: $e');
    }
  }

  void _playAudio(String audioPath) async {
    try {
      await _audioPlayer.setAsset(audioPath);
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  void _onImageTap() {
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
      final audioPath = 'assets/audios/stories/ABC/audio1.$_currentIndex.mp3';
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
              duration: Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.left,
                  position: animation,
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
    Key? key,
    required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key, listenable: position) {
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