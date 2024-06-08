/*
 * Project Name:  StoryLingoKids
 * File Name:     test_text_card.dart
 * File Function: 测试文本卡片
 * Author:        林继申
 * Update Date:   2024-06-08
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
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class TestTextCard extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;

  const TestTextCard({
    super.key,
    required this.title,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSize = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
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
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              style: TextStyle(fontSize: fontSize),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'CabinSketch',
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
