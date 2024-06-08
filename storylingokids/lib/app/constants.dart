import 'package:flutter/material.dart'
    show Color, Colors, FontWeight, TextStyle;

const kHeadingTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 64,
  fontWeight: FontWeight.w700,
  letterSpacing: 4.0,
);

const kSubTextStyle = TextStyle(
  color: Color(0xFF959595),
  fontSize: 16,
);

Color getIndexColor(int index, {double opacity = 0.8}) {
  return Colors.primaries[index % Colors.primaries.length].withOpacity(opacity);
}
