/*
 * Project Name:  StoryLingoKids
 * File Name:     test_color_card.dart
 * File Function: 测试颜色卡片
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
        InkWell,
        Material,
        MaterialType,
        Offset,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class TestColorCard extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;

  const TestColorCard({
    super.key,
    this.isActive = false,
    required this.title,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 130,
    this.fontSizeActive = 180,
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
              style: isActive
                  ? TextStyle(fontSize: fontSizeActive)
                  : TextStyle(fontSize: fontSizeBase),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              child: const Text(''),
            ),
          ),
        ),
      ),
    );
  }
}
