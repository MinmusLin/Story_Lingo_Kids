/*
 * Project Name:  StoryLingoKids
 * File Name:     test_image_card.dart
 * File Function: 测试图片卡片
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
        BoxFit,
        BoxShadow,
        BuildContext,
        Clip,
        Color,
        Colors,
        Container,
        Curves,
        Image,
        InkWell,
        Material,
        MaterialType,
        Offset,
        Stack,
        StatelessWidget,
        TextStyle,
        Widget;

class TestImageCard extends StatelessWidget {
  final String title;
  final String image;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;

  const TestImageCard({
    super.key,
    required this.title,
    required this.image,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSize = 20,
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
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: fontSize),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceOut,
                  child: Image.asset(
                    image,
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
