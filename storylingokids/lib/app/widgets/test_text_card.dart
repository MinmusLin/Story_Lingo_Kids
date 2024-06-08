/*
 * Project Name:  StoryLingoKids
 * File Name:     test_text_card.dart
 * File Function: 测试文本卡片
 * Author:        林继申
 * Update Date:   2024-06-09
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedDefaultTextStyle,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Clip,
        Color,
        Colors,
        Container,
        Curves,
        FontWeight,
        InkWell,
        Material,
        MaterialType,
        Offset,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        VoidCallback,
        Widget;

class TestTextCard extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback onPressed;
  final VoidCallback onReleased;

  const TestTextCard({
    super.key,
    required this.title,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSize = 130,
    required this.onPressed,
    required this.onReleased,
  });

  @override
  State<TestTextCard> createState() => _TestTextCardState();
}

class _TestTextCardState extends State<TestTextCard> {
  late Color currentBackgroundColor;

  @override
  void initState() {
    super.initState();
    currentBackgroundColor = widget.backgroundColor;
  }

  void _handlePress() {
    widget.onPressed();
    setState(() {
      currentBackgroundColor = widget.backgroundColor.withOpacity(0.8);
    });
  }

  void _handleRelease() {
    widget.onReleased();
    setState(() {
      currentBackgroundColor = widget.backgroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: currentBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: const Color(0xFF4056C6).withOpacity(.15),
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15.0),
        type: MaterialType.transparency,
        child: InkWell(
          onTapDown: (_) => _handlePress(),
          onTapUp: (_) => _handleRelease(),
          onTapCancel: _handleRelease,
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor,
                fontFamily: 'CabinSketch',
                fontWeight: FontWeight.w700,
              ),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              child: Text(widget.title, softWrap: false),
            ),
          ),
        ),
      ),
    );
  }
}
