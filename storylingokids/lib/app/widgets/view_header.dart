/*
 * Project Name:  StoryLingoKids
 * File Name:     view_header.dart
 * File Function: 页面顶部
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        Alignment,
        AssetImage,
        BoxDecoration,
        BoxFit,
        BuildContext,
        ClipPath,
        Color,
        Colors,
        Column,
        Container,
        CustomClipper,
        DecorationImage,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        InkWell,
        LinearGradient,
        MainAxisAlignment,
        Navigator,
        Path,
        Positioned,
        Row,
        Size,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        VoidCallback,
        Widget,
        debugPrint;
import 'package:flutter/services.dart'
    show Color, FontWeight, HapticFeedback, Size, VoidCallback;
import 'package:just_audio/just_audio.dart' show AudioPlayer;

class ViewHeader extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final double offset;
  final VoidCallback? onTap;
  final VoidCallback? onTest;

  const ViewHeader({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.offset,
    this.onTap,
    this.onTest,
  });

  @override
  State<ViewHeader> createState() => _ViewHeaderState();
}

class _ViewHeaderState extends State<ViewHeader> {
  final _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _popAudio() async {
    try {
      await _audioPlayer.setAsset(
        'assets/audios/effects/Backward.wav',
      );
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
  }

  void _testAudio() async {
    try {
      await _audioPlayer.setAsset(
        'assets/audios/effects/Forward.wav',
      );
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ViewClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [widget.primaryColor, widget.secondaryColor],
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/background/Top.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _popAudio();
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '<<',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _testAudio();
                    if (widget.onTest != null) {
                      widget.onTest!();
                    }
                  },
                  child: const Text(
                    '🎙️',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: InkWell(
                onTap: widget.onTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 30 - widget.offset / 4,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 0, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
