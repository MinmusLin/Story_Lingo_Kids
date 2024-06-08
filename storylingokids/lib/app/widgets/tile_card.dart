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
        VoidCallback,
        Widget;

class TileCard extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;
  final VoidCallback onTap;

  const TileCard({
    super.key,
    this.isActive = false,
    required this.title,
    this.textColor = const Color(0xFF303030),
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 130,
    this.fontSizeActive = 180,
    required this.onTap,
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
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              style: isActive
                  ? TextStyle(fontSize: fontSizeActive)
                  : TextStyle(fontSize: fontSizeBase),
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
