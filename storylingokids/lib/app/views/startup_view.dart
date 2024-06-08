import 'package:flutter/material.dart'
    show
        AnimatedBuilder,
        AnimatedContainer,
        AnimatedOpacity,
        Animation,
        AnimationController,
        AnimationStatus,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BoxShape,
        BuildContext,
        Center,
        Color,
        Colors,
        Container,
        Curves,
        EdgeInsets,
        FadeTransition,
        FontWeight,
        Image,
        MainAxisAlignment,
        Navigator,
        Padding,
        PageRouteBuilder,
        Row,
        Scaffold,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextStyle,
        TickerProviderStateMixin,
        Transform,
        Tween,
        Widget,
        debugPrint;
import 'package:flutter/services.dart'
    show Color, FontWeight, HapticFeedback, TextAlign;
import 'package:just_audio/just_audio.dart' show AudioPlayer;
import 'package:storylingokids/app/views/home_view.dart' show HomeView;
import 'dart:async' show Timer;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  final _audioPlayer = AudioPlayer();
  double _opacity = 0;
  bool _value = true;

  void _introAudio() async {
    try {
      await _audioPlayer.setAsset('assets/audios/effects/Startup.mp3');
      _audioPlayer.setVolume(2.0);
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Error loading audio source: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _introAudio();
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            HapticFeedback.lightImpact();
            Navigator.of(context).pushReplacement(
              ThisIsFadeRoute(
                route: const HomeView(),
              ),
            );
          }
        },
      );
    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'WELCOME\nTO\nSTORY LINGO KIDS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CabinSketch',
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2),
                height: _value ? 50 : 200,
                width: _value ? 50 : 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFBAFCF4).withOpacity(.2),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                  color: const Color(0xFFBAFCF4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/Icon.png'),
                        AnimatedBuilder(
                          animation: scaleAnimation,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation.value,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFBAFCF4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget route;

  ThisIsFadeRoute({required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
