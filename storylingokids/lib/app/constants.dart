import 'dart:math';
import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecoverColor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = const Color(0xFF4056C6).withOpacity(.15);

const kHeadingTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 64,
  fontWeight: FontWeight.w700,
  letterSpacing: 4.0,
);

const kSubTextStyle = TextStyle(
  color: kTextLightColor,
  fontSize: 16,
);

const kTitleTextStyle = TextStyle(
  color: kTitleTextColor,
  fontSize: 32,
  fontWeight: FontWeight.w700,
  fontFamily: 'CabinSketch',
);

Color getRandomColor({double opacity = 0.8}) {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(opacity);
}

Color getIndexColor(int index, {double opacity = 0.8}) {
  return Colors.primaries[index % Colors.primaries.length].withOpacity(opacity);
}
