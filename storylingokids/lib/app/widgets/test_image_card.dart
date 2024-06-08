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
  final bool isActive;
  final String title;
  final String image;
  final Color textColor;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;

  const TestImageCard({
    super.key,
    this.isActive = false,
    required this.title,
    required this.image,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 20,
    this.fontSizeActive = 22,
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
                  style: isActive
                      ? TextStyle(fontSize: fontSizeActive)
                      : TextStyle(fontSize: fontSizeBase),
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
