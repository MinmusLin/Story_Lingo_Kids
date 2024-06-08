/*
 * Project Name:  StoryLingoKids
 * File Name:     test_image_card.dart
 * File Function: 测试图片卡片
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
        BoxFit,
        BoxShadow,
        BuildContext,
        Clip,
        Color,
        Colors,
        Container,
        Curves,
        FontWeight,
        Image,
        InkWell,
        Material,
        MaterialType,
        Offset,
        Stack,
        State,
        StatefulWidget,
        TextStyle,
        VoidCallback,
        Widget;

class TestImageCard extends StatefulWidget {
  final String title;
  final String image;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback onPressed;
  final VoidCallback onReleased;

  const TestImageCard({
    super.key,
    required this.title,
    required this.image,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSize = 20,
    required this.onPressed,
    required this.onReleased,
  });

  @override
  State<TestImageCard> createState() => _TestImageCardState();
}

class _TestImageCardState extends State<TestImageCard> {
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
          child: Stack(
            children: [
              Container(
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
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
